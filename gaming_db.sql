CREATE DATABASE gaming_store_db;

USE gaming_store_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

USE gaming_store_db;


INSERT INTO customers VALUES
(1, 'Arjun', 'arjun@gmail.com', 'Hyderabad'),
(2, 'Sai', 'sai@gmail.com', 'Vijayawada'),
(3, 'Rahul', 'rahul@gmail.com', 'Guntur'),
(4, 'Kiran', 'kiran@gmail.com', 'Vizag'),
(5, 'Teja', 'teja@gmail.com', 'Tirupati');




INSERT INTO categories VALUES
(101, 'Action'),
(102, 'Adventure'),
(103, 'Racing'),
(104, 'Sports');



INSERT INTO games VALUES
(1001, 'Shadow Strike', 2499.00, 15, 101),
(1002, 'Dragon Quest', 1999.00, 10, 102),
(1003, 'Speed Racer X', 1499.00, 20, 103),
(1004, 'Football Legends', 2999.00, 8, 104),
(1005, 'Battle Arena', 1799.00, 12, 101),
(1006, 'Jungle Adventure', 1599.00, 18, 102);



INSERT INTO orders VALUES
(5001, 1, '2026-05-01', 2499.00),
(5002, 2, '2026-05-03', 1999.00),
(5003, 3, '2026-05-05', 1499.00),
(5004, 1, '2026-05-07', 2999.00),
(5005, 4, '2026-05-10', 1799.00);



INSERT INTO payments VALUES
(9001, 5001, 'UPI', 'Paid'),
(9002, 5002, 'Card', 'Paid'),
(9003, 5003, 'Cash', 'Pending'),
(9004, 5004, 'UPI', 'Paid'),
(9005, 5005, 'Card', 'Pending');

-- 1. Display games with price greater than 2000

SELECT * 
FROM games
WHERE price > 2000;
