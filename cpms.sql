# Group1CPMS
CREATE DATABASE ParkingSystem;
USE ParkingSystem;

-- Admin Table
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY,
    FName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    Role ENUM('Manager', 'Staff') NOT NULL
);

-- User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    FName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType ENUM('Regular', 'VIP') NOT NULL
);

-- Parking Slot Table
CREATE TABLE ParkingSlot (
    slot_id INT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    admin_id INT,
    status ENUM('Available', 'Occupied', 'Reserved') NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id) ON DELETE SET NULL
);

-- Reservation Table
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    reservationDate DATETIME NOT NULL,
    booking_date DATETIME NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Ticket Table
CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY,
    entryTime DATETIME NOT NULL,
    duration INT NOT NULL,
    baseRate DECIMAL(10,2) NOT NULL,
    penaltyRate DECIMAL(10,2) NOT NULL,
    status ENUM('Active', 'Expired', 'Paid') NOT NULL,
    reservation_id INT,
    slot_id INT,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id) ON DELETE SET NULL,
    FOREIGN KEY (slot_id) REFERENCES ParkingSlot(slot_id) ON DELETE CASCADE
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    amount_paid DECIMAL(10,2) NOT NULL,
    ticket_id INT,
    user_id INT,
    paymentMethod ENUM('Cash', 'Card', 'Online') NOT NULL,
    paymentDate DATETIME NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

SELECT* FROM payment; 