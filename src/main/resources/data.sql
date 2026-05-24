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
INSERT INTO users (full_name, email, phone, password, role, blocked, created_at) VALUES 
('Иван Петров', 'client@example.com', '+7 (901) 111-22-33', 'password123', 'CLIENT', false, NOW()),
('Мария Иванова', 'consultant@example.com', '+7 (902) 222-33-44', 'password123', 'CONSULTANT', false, NOW()),
('Алексей Смирнов', 'admin@example.com', '+7 (903) 333-44-55', 'password123', 'ADMIN', false, NOW()),
('Елена Козлова', 'superadmin@example.com', '+7 (904) 444-55-66', 'password123', 'SUPER_ADMIN', false, NOW());

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
INSERT INTO products (name, description, price, image_url, quantity_in_stock, category_id, manufacturer, manufacturer_phone, manufacturer_email, type, color, material, active, created_at) VALUES 
('Кресло компьютерное ErgoChair Pro', 'Эргономичное кресло с поддержкой поясницы', 15990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 25, 1, 'ErgoFactory', '+7 (495) 111-22-33', 'info@ergofactory.ru', 'Офисная', 'Черный', 'Ткань/Пластик', true, NOW()),
('Диван угловой Комфорт', 'Просторный угловой диван с механизмом раскладывания', 45990, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=300', 8, 2, 'MebelSoft', '+7 (495) 222-33-44', 'sales@mebelsoft.ru', 'Мягкая', 'Бежевый', 'Велюр/ППУ', true, NOW()),
('Стол письменный Престиж', 'Компактный письменный стол с выдвижными ящиками', 8990, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=300', 15, 3, 'OfficeStyle', '+7 (495) 333-44-55', 'order@officestyle.ru', 'Корпусная', 'Дуб', 'ЛДСП/Металл', true, NOW()),
('Шкаф-купе Трио', 'Трехдверный шкаф-купе с зеркальными дверями', 38990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 5, 4, 'ClosetMaster', '+7 (495) 444-55-66', 'info@closetmaster.ru', 'Корпусная', 'Орех', 'ЛДСП/Зеркало', true, NOW()),
('Кровать двуспальная Ренессанс', 'Классическая деревянная кровать с высоким изголовьем', 28990, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=300', 12, 5, 'DreamBed', '+7 (495) 555-66-77', 'dream@dreambed.ru', 'Корпусная', 'Вишня', 'Массив дерева', true, NOW()),
('Стул кухонный Венеция', 'Удобный стул с мягким сиденьем', 3490, 'https://images.unsplash.com/photo-1503602642458-232111445657?w=300', 45, 6, 'ChairPro', '+7 (495) 666-77-88', 'sales@chairpro.ru', 'Кухонная', 'Красный', 'Металл/Экокожа', true, NOW()),
('Тумба под телевизор Модерн', 'Современная тумба с двумя выдвижными ящиками', 12990, 'https://images.unsplash.com/photo-1551298370-9d3d53740c6c?w=300', 18, 7, 'FurniModern', '+7 (495) 777-88-99', 'info@furnimodern.ru', 'Корпусная', 'Серебро', 'ЛДСП/МДФ', true, NOW()),
('Полка навесная Лофт', 'Стильная навесная полка в индустриальном стиле', 2490, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 30, 8, 'LoftStyle', '+7 (495) 888-99-00', 'loft@loftstyle.ru', 'Для гостиной', 'Черный', 'Металл/Стекло', true, NOW()),
('Комод Классик', 'Элегантный комод с 4 выдвижными ящиками', 15990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 7, 9, 'ClassicHome', '+7 (495) 999-00-11', 'classic@classichome.ru', 'Корпусная', 'Белый', 'МДФ/Латунь', true, NOW()),
('Кресло-мешок Бинбэг', 'Бескаркасное кресло с наполнителем из пенополистирола', 5990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 22, 1, 'BeanBagCo', '+7 (495) 000-11-22', 'beanbag@beanbagco.ru', 'Мягкая', 'Голубой', 'Ткань/Пенополистирол', true, NOW()),
('Диван прямой Милан', 'Стильный прямой диван с деревянными ножками', 32990, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=300', 0, 2, 'MilanFurniture', '+7 (495) 111-22-33', 'milan@milanfurniture.ru', 'Мягкая', 'Серый', 'Велюр/Дерево', true, NOW()),
('Стол журнальный Эко', 'Журнальный столик со стеклянной столешницей', 5490, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=300', 14, 3, 'EcoDesign', '+7 (495) 222-33-44', 'eco@ecodesign.ru', 'Для гостиной', 'Золото', 'Стекло/Металл', true, NOW()),
('Шкаф угловой Компакт', 'Угловой шкаф для маленьких помещений', 25990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 3, 4, 'SpaceSave', '+7 (495) 333-44-55', 'space@spacesave.ru', 'Корпусная', 'Дуб', 'ЛДСП', true, NOW()),
('Кровать детская Сказка', 'Детская кровать с бортиками', 11990, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=300', 9, 5, 'KidsDream', '+7 (495) 444-55-66', 'kids@kidsdream.ru', 'Детская', 'Белый', 'Массив сосны', true, NOW()),
('Стул офисный Оптима', 'Легкий и удобный офисный стул на колесиках', 6990, 'https://images.unsplash.com/photo-1503602642458-232111445657?w=300', 0, 6, 'OfficeComfort', '+7 (495) 555-66-77', 'office@officecomfort.ru', 'Офисная', 'Черный', 'Пластик/Ткань', true, NOW()),
('Тумба прикроватная Ночка', 'Компактная тумба с одним выдвижным ящиком', 3990, 'https://images.unsplash.com/photo-1551298370-9d3d53740c6c?w=300', 20, 7, 'NightStand', '+7 (495) 666-77-88', 'night@nightstand.ru', 'Корпусная', 'Орех', 'ЛДСП', true, NOW()),
('Стеллаж Лайт', 'Открытый стеллаж из металла и стекла', 8990, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=300', 11, 10, 'LightShelves', '+7 (495) 777-88-99', 'light@lightshelves.ru', 'Для гостиной', 'Серебро', 'Металл/Стекло', true, NOW()),
('Кресло для гостиной Люкс', 'Роскошное кресло с бархатной обивкой', 18990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 6, 1, 'LuxurySeat', '+7 (495) 888-99-00', 'luxury@luxuryseat.ru', 'Мягкая', 'Бирюзовый', 'Бархат/Дерево', true, NOW()),
('Стол раскладной Трансформер', 'Раскладной стол-трансформер', 10990, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=300', 4, 3, 'SpaceSaver', '+7 (495) 999-00-11', 'space@spacesaver.ru', 'Кухонная', 'Белый', 'ЛДСП/Металл', true, NOW()),
('Пуф мягкий Уют', 'Мягкий пуф с искусственной кожей', 2990, 'https://images.unsplash.com/photo-1580480055278-228e1a5b2d6f?w=300', 35, 1, 'CozyHome', '+7 (495) 000-11-22', 'cozy@cozyhome.ru', 'Мягкая', 'Красный', 'Искусственная кожа', true, NOW());

-- ========== ТЕСТОВЫЕ ЗАЯВКИ ==========
INSERT INTO requests (user_id, product_id, full_name, phone, email, status, request_date) VALUES 
(1, 1, 'Иван Петров', '+7 (901) 111-22-33', 'client@example.com', 'PENDING', NOW() - INTERVAL '2 days'),
(1, 3, 'Иван Петров', '+7 (901) 111-22-33', 'client@example.com', 'APPROVED', NOW() - INTERVAL '5 days'),
(1, 5, 'Иван Петров', '+7 (901) 111-22-33', 'client@example.com', 'COMPLETED', NOW() - INTERVAL '10 days'),
(2, 2, 'Мария Иванова', '+7 (902) 222-33-44', 'consultant@example.com', 'IN_PROGRESS', NOW() - INTERVAL '1 day');