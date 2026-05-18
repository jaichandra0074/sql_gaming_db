CREATE DATABASE IF NOT EXISTS bookstore_db;

USE bookstore_db;

-- 1. Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- 2. Genres
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- 3. Customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    join_date DATE
);

-- 4. Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    price DECIMAL(10,2),
    stock_quantity INT,
    author_id INT,
    genre_id INT,
    
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- 5. Orders
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. Order_Details
CREATE TABLE Order_Details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity_ordered INT,
    price_at_time_of_order DECIMAL(10,2),
    
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert Authors
INSERT INTO Authors (author_name, bio) VALUES
('Chetan Bhagat', 'Indian author known for 5 Point Someone.'),
('Arundhati Roy', 'Winner of the Man Booker Prize.'),
('R.K. Narayan', 'Creator of Malgudi Days.'),
('Amish Tripathi', 'Known for the Shiva Trilogy.');

-- Insert Genres
INSERT INTO Genres (genre_name) VALUES
('Fiction'),
('Mythology'),
('History'),
('Romance');

-- Insert Books
INSERT INTO Books
(title, price, stock_quantity, author_id, genre_id)
VALUES
('Five Point Someone', 250.00, 50, 1, 1),
('2 States', 300.00, 40, 1, 4),
('The God of Small Things', 450.00, 20, 2, 1),
('Malgudi Days', 200.00, 100, 3, 1),
('The Immortals of Meluha', 399.00, 60, 4, 2);

-- Insert Customers
INSERT INTO Customers
(name, email, city, join_date)
VALUES
('Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '2023-01-10'),
('Diya Patel', 'diya.p@yahoo.com', 'Ahmedabad', '2023-02-15'),
('Vihaan Reddy', 'vihaan.r@outlook.com', 'Hyderabad', '2023-03-20'),
('Ananya Gupta', 'ananya.g@gmail.com', 'Delhi', '2023-04-05');

-- Insert Orders
INSERT INTO Orders
(order_date, customer_id)
VALUES
('2023-05-01', 1),
('2023-05-03', 2),
('2023-05-05', 1),
('2023-06-01', 3);

-- Insert Order_Details
INSERT INTO Order_Details
(order_id, book_id, quantity_ordered, price_at_time_of_order)
VALUES
(1, 1, 1, 250.00),
(1, 4, 2, 200.00),
(2, 5, 1, 399.00),
(3, 2, 1, 300.00),
(4, 3, 1, 450.00);
