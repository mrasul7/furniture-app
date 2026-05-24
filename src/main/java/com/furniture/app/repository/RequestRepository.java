package com.furniture.app.repository;

import com.furniture.app.model.Request;
import com.furniture.app.model.User;
import com.furniture.app.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long>, JpaSpecificationExecutor<Request> {
    Optional<Request> findByUserAndProductAndRequestDateAfter(User user, Product product, LocalDateTime date);
}