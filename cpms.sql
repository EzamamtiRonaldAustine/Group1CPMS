CREATE DATABASE ParkingSystem;
USE ParkingSystem;

-- Admin Table
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    Role ENUM('Manager', 'Staff') NOT NULL
);
