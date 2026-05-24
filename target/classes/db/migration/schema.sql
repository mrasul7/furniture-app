-- Очистка существующих данных
TRUNCATE TABLE requests CASCADE;
TRUNCATE TABLE products CASCADE;
TRUNCATE TABLE categories CASCADE;
TRUNCATE TABLE users CASCADE;

-- Сброс последовательностей
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE categories_id_seq RESTART WITH 1;
ALTER SEQUENCE products_id_seq RESTART WITH 1;
ALTER SEQUENCE requests_id_seq RESTART WITH 1;

-- ========== ПОЛЬЗОВАТЕЛИ ==========
-- Пароли закодированы: для всех пароль "password123"
-- admin123 закодирован как: $2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EHs

-- Клиент (обычный пользователь)
INSERT INTO users (full_name, email, phone, password, role, blocked, created_at) VALUES 
('Иван Петров', 'client@example.com', '+7 (901) 111-22-33', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iK.VZ6y', 'CLIENT', false, NOW());

-- Консультант
INSERT INTO users (full_name, email, phone, password, role, blocked, created_at) VALUES 
('Мария Иванова', 'consultant@example.com', '+7 (902) 222-33-44', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iK.VZ6y', 'CONSULTANT', false, NOW());

-- Администратор
INSERT INTO users (full_name, email, phone, password, role, blocked, created_at) VALUES 
('Алексей Смирнов', 'admin@example.com', '+7 (903) 333-44-55', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iK.VZ6y', 'ADMIN', false, NOW());

-- Суперадминистратор
INSERT INTO users (full_name, email, phone, password, role, blocked, created_at) VALUES 
('Елена Козлова', 'superadmin@example.com', '+7 (904) 444-55-66', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iK.VZ6y', 'SUPER_ADMIN', false, NOW());

-- ========== КАТЕГОРИИ ==========
INSERT INTO categories (name, description) VALUES 
('Кресла', 'Удобные и стильные кресла для дома и офиса'),
('Диваны', 'Мягкая мебель для гостиной и отдыха'),
('Столы', 'Письменные, обеденные и журнальные столы'),
('Шкафы', 'Вместительные шкафы для хранения вещей'),
('Кровати', 'Комфортные кровати для здорового сна'),
('Стулья', 'Стулья для кухни, столовой и офиса'),
('Тумбы', 'Тумбы под телевизор и прикроватные тумбы'),
('Полки', 'Навесные и напольные полки'),
('Комоды', 'Вместительные комоды для хранения'),
('Стеллажи', 'Открытые системы хранения');

-- ========== ТОВАРЫ (20 штук) ==========

-- 1. Кресло компьютерное (категория: Кресла)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Кресло компьютерное ErgoChair Pro', 'Эргономичное кресло с поддержкой поясницы, регулировкой высоты и подлокотников. Идеально для длительной работы за компьютером.', 15990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 25, 1, 'ErgoFactory', '+7 (495) 111-22-33', 'info@ergofactory.ru', 'Офисная', 'Черный', 'Ткань/Пластик', true, NOW());

-- 2. Диван угловой (категория: Диваны)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Диван угловой Комфорт', 'Просторный угловой диван с механизмом раскладывания "еврокнижка". Обивка из велюра, наполнитель - пенополиуретан.', 45990, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=300', 8, 2, 'MebelSoft', '+7 (495) 222-33-44', 'sales@mebelsoft.ru', 'Мягкая', 'Бежевый', 'Велюр/ППУ', true, NOW());

-- 3. Стол письменный (категория: Столы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Стол письменный Престиж', 'Компактный письменный стол с выдвижными ящиками. Столешница из ЛДСП, металлические направляющие.', 8990, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=300', 15, 3, 'OfficeStyle', '+7 (495) 333-44-55', 'order@officestyle.ru', 'Корпусная', 'Дуб', 'ЛДСП/Металл', true, NOW());

-- 4. Шкаф-купе (категория: Шкафы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Шкаф-купе Трио', 'Трехдверный шкаф-купе с зеркальными дверями. Внутреннее наполнение: штанга, полки, выдвижные ящики.', 38990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 5, 4, 'ClosetMaster', '+7 (495) 444-55-66', 'info@closetmaster.ru', 'Корпусная', 'Орех', 'ЛДСП/Зеркало', true, NOW());

-- 5. Кровать двуспальная (категория: Кровати)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Кровать двуспальная Ренессанс', 'Классическая деревянная кровать с высоким изголовьем. Ортопедическое основание.', 28990, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=300', 12, 5, 'DreamBed', '+7 (495) 555-66-77', 'dream@dreambed.ru', 'Корпусная', 'Вишня', 'Массив дерева', true, NOW());

-- 6. Стул кухонный (категория: Стулья)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Стул кухонный Венеция', 'Удобный стул с мягким сиденьем. Металлический каркас, обивка из экокожи.', 3490, 'https://images.unsplash.com/photo-1503602642458-232111445657?w=300', 45, 6, 'ChairPro', '+7 (495) 666-77-88', 'sales@chairpro.ru', 'Кухонная', 'Красный', 'Металл/Экокожа', true, NOW());

-- 7. Тумба под телевизор (категория: Тумбы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Тумба под телевизор Модерн', 'Современная тумба с двумя выдвижными ящиками и открытыми полками.', 12990, 'https://images.unsplash.com/photo-1551298370-9d3d53740c6c?w=300', 18, 7, 'FurniModern', '+7 (495) 777-88-99', 'info@furnimodern.ru', 'Корпусная', 'Серебро', 'ЛДСП/МДФ', true, NOW());

-- 8. Полка навесная (категория: Полки)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Полка навесная Лофт', 'Стильная навесная полка в индустриальном стиле. Крепление на стену.', 2490, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 30, 8, 'LoftStyle', '+7 (495) 888-99-00', 'loft@loftstyle.ru', 'Для гостиной', 'Черный', 'Металл/Стекло', true, NOW());

-- 9. Комод (категория: Комоды)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Комод Классик', 'Элегантный комод с 4 выдвижными ящиками. Ручки из латуни.', 15990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 7, 9, 'ClassicHome', '+7 (495) 999-00-11', 'classic@classichome.ru', 'Корпусная', 'Белый', 'МДФ/Латунь', true, NOW());

-- 10. Кресло-мешок (категория: Кресла)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Кресло-мешок Бинбэг', 'Бескаркасное кресло с наполнителем из пенополистирола. Легкое и удобное.', 5990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 22, 1, 'BeanBagCo', '+7 (495) 000-11-22', 'beanbag@beanbagco.ru', 'Мягкая', 'Голубой', 'Ткань/Пенополистирол', true, NOW());

-- 11. Диван прямой (категория: Диваны)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Диван прямой Милан', 'Стильный прямой диван с деревянными ножками. Механизм "аккордеон".', 32990, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=300', 0, 2, 'MilanFurniture', '+7 (495) 111-22-33', 'milan@milanfurniture.ru', 'Мягкая', 'Серый', 'Велюр/Дерево', true, NOW());

-- 12. Стол журнальный (категория: Столы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Стол журнальный Эко', 'Журнальный столик со стеклянной столешницей и металлическим каркасом.', 5490, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=300', 14, 3, 'EcoDesign', '+7 (495) 222-33-44', 'eco@ecodesign.ru', 'Для гостиной', 'Золото', 'Стекло/Металл', true, NOW());

-- 13. Шкаф угловой (категория: Шкафы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Шкаф угловой Компакт', 'Угловой шкаф для маленьких помещений. Вместительный и функциональный.', 25990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 3, 4, 'SpaceSave', '+7 (495) 333-44-55', 'space@spacesave.ru', 'Корпусная', 'Дуб', 'ЛДСП', true, NOW());

-- 14. Кровать детская (категория: Кровати)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Кровать детская Сказка', 'Детская кровать с бортиками. Подходит для детей от 3 лет.', 11990, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=300', 9, 5, 'KidsDream', '+7 (495) 444-55-66', 'kids@kidsdream.ru', 'Детская', 'Белый', 'Массив сосны', true, NOW());

-- 15. Стул офисный (категория: Стулья)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Стул офисный Оптима', 'Легкий и удобный офисный стул на колесиках. Регулировка высоты.', 6990, 'https://images.unsplash.com/photo-1503602642458-232111445657?w=300', 0, 6, 'OfficeComfort', '+7 (495) 555-66-77', 'office@officecomfort.ru', 'Офисная', 'Черный', 'Пластик/Ткань', true, NOW());

-- 16. Тумба прикроватная (категория: Тумбы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Тумба прикроватная Ночка', 'Компактная тумба с одним выдвижным ящиком.', 3990, 'https://images.unsplash.com/photo-1551298370-9d3d53740c6c?w=300', 20, 7, 'NightStand', '+7 (495) 666-77-88', 'night@nightstand.ru', 'Корпусная', 'Орех', 'ЛДСП', true, NOW());

-- 17. Стеллаж (категория: Стеллажи)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Стеллаж Лайт', 'Открытый стеллаж из металла и стекла. Подходит для книг и декора.', 8990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 11, 10, 'LightShelves', '+7 (495) 777-88-99', 'light@lightshelves.ru', 'Для гостиной', 'Серебро', 'Металл/Стекло', true, NOW());

-- 18. Кресло для гостиной (категория: Кресла)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Кресло для гостиной Люкс', 'Роскошное кресло с бархатной обивкой и деревянными подлокотниками.', 18990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 6, 1, 'LuxurySeat', '+7 (495) 888-99-00', 'luxury@luxuryseat.ru', 'Мягкая', 'Бирюзовый', 'Бархат/Дерево', true, NOW());

-- 19. Стол раскладной (категория: Столы)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Стол раскладной Трансформер', 'Раскладной стол-трансформер. Экономит пространство в маленькой кухне.', 10990, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=300', 4, 3, 'SpaceSaver', '+7 (495) 999-00-11', 'space@spacesaver.ru', 'Кухонная', 'Белый', 'ЛДСП/Металл', true, NOW());

-- 20. Пуф (категория: Кресла)
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Пуф мягкий Уют', 'Мягкий пуф с искусственной кожей. Используется как сиденье или подставка для ног.', 2990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 35, 1, 'CozyHome', '+7 (495) 000-11-22', 'cozy@cozyhome.ru', 'Мягкая', 'Красный', 'Искусственная кожа', true, NOW());

-- ========== ТЕСТОВЫЕ ЗАЯВКИ ==========
INSERT INTO requests (user_id, product_id, full_name, phone, email, status, request_date) VALUES 
(1, 1, 'Иван Петров', '+7 (901) 111-22-33', 'client@example.com', 'PENDING', NOW() - INTERVAL '2 days'),
(1, 3, 'Иван Петров', '+7 (901) 111-22-33', 'client@example.com', 'APPROVED', NOW() - INTERVAL '5 days'),
(1, 5, 'Иван Петров', '+7 (901) 111-22-33', 'client@example.com', 'COMPLETED', NOW() - INTERVAL '10 days'),
(2, 2, 'Мария Иванова', '+7 (902) 222-33-44', 'consultant@example.com', 'IN_PROGRESS', NOW() - INTERVAL '1 day');