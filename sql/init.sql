-- Tạo database (chạy lệnh này trong postgres DB trước)
CREATE DATABASE inventory_db;

-- Chuyển sang database inventory_db
\c inventory_db

-- Tạo bảng Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng Products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng Orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    total NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng OrderItems
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT REFERENCES products(id) ON DELETE CASCADE,
    quantity INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- Sample data
INSERT INTO users (name, email) VALUES 
('Hieu', 'hieu@example.com'),
('Admin', 'admin@example.com');

INSERT INTO products (name, description, price, quantity) VALUES
('Laptop', 'Dell XPS 13', 1200.00, 10),
('Phone', 'iPhone 15 Pro', 1500.00, 20),
('Mouse', 'Logitech MX Master 3', 99.99, 50);
