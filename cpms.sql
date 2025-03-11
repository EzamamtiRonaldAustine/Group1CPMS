# Group1CPMS
CREATE DATABASE ParkingSystem;
USE ParkingSystem;
use smart_parking;

-- Admin Table
CREATE TABLE Admin (
<<<<<<< HEAD
    admin_id VARCHAR(5) PRIMARY KEY,
=======
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
    FName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    Role ENUM('Manager', 'Staff') NOT NULL
);

-- User Table
CREATE TABLE User (
<<<<<<< HEAD
    user_id VARCHAR(5) PRIMARY KEY,
=======
    user_id INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
    FName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType ENUM('Regular', 'VIP') NOT NULL
);

-- Parking Slot Table
CREATE TABLE ParkingSlot (
<<<<<<< HEAD
    slot_id VARCHAR(5) PRIMARY KEY,
=======
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
    location VARCHAR(255) NOT NULL,
    admin_id VARCHAR(5),
    status ENUM('Available', 'Occupied', 'Reserved') NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

-- Reservation Table
CREATE TABLE Reservation (
<<<<<<< HEAD
    reservation_id VARCHAR(5) PRIMARY KEY,
=======
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
    reservationDate DATETIME NOT NULL,
    booking_date DATETIME NOT NULL,
    user_id VARCHAR(5),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Ticket Table
CREATE TABLE Ticket (
<<<<<<< HEAD
    ticket_id VARCHAR(5) PRIMARY KEY,
=======
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
    entryTime DATETIME NOT NULL,
    duration INT NOT NULL,
    baseRate DECIMAL(10,2) NOT NULL,
    penaltyRate DECIMAL(10,2) NOT NULL,
    status ENUM('Active', 'Expired', 'Paid') NOT NULL,
    reservation_id VARCHAR(5),
    slot_id VARCHAR(5),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (slot_id) REFERENCES ParkingSlot(slot_id)
);

-- Payment Table
CREATE TABLE Payment (
<<<<<<< HEAD
    payment_id VARCHAR(5) PRIMARY KEY,
=======
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
    amount_paid DECIMAL(10,2) NOT NULL,
    ticket_id VARCHAR(5),
    user_id VARCHAR(5),
    paymentMethod ENUM('Mobile money', 'Flexi_Pay') NOT NULL,
    paymentDate DATETIME NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

<<<<<<< HEAD
DESC Admin;

DESC User;

DESC ParkingSlot;

DESC Reservation;

DESC Ticket;

DESC Payment;

select * from reservation;

UPDATE User SET FName = UPPER(FName);
=======
SELECT* FROM payment;

select * from reservation;
ALTER TABLE User ADD COLUMN r VARCHAR(50) AFTER Email;
DESC User;
>>>>>>> 1efcd652018bdb25055c269c8f215144c42f078a
