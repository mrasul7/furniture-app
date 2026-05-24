FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Копирование JAR файла
COPY target/furniture-app-1.0.0.jar app.jar

# Создание непривилегированного пользователя
RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup && \
    chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]