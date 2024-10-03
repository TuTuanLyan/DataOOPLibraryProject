CREATE DATABASE LoginData;

USE LoginData;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'customer') NOT NULL
);

INSERT INTO users (username, password, role)
VALUES 
('PHM', 'phm', 'admin'),
('DNMD', 'dnmd', 'admin'),
('NTAT', 'ntat', 'admin'),
('customer1', 'pw1', 'customer'),
('customer2', 'pw2', 'customer'),
('customer3', 'pw3', 'customer');

