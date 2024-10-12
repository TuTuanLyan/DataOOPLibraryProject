CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    year_published INT,
    isbn VARCHAR(20) UNIQUE,
    status ENUM('AVAILABLE', 'BORROWED', 'DAMAGED', 'LOST') DEFAULT 'AVAILABLE'
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    borrow_date DATETIME,
    due_date DATETIME,
    return_date DATETIME,
    fine DOUBLE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
