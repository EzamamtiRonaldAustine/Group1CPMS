# Group1CPMS
-- CREATE DATABASE ParkingSystem;
-- USE ParkingSystem;

-- Admin Table
CREATE TABLE Admin (
    admin_id VARCHAR(5) PRIMARY KEY,
    FName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    Role ENUM('Manager', 'Staff') NOT NULL
);

-- User Table
CREATE TABLE User (
    user_id VARCHAR(5) PRIMARY KEY,
    FName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType ENUM('Regular', 'VIP') NOT NULL
);

-- Parking Slot Table
CREATE TABLE ParkingSlot (
    slot_id VARCHAR(5) PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    admin_id VARCHAR(5),
    status ENUM('Available', 'Occupied', 'Reserved') NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

-- Reservation Table
CREATE TABLE Reservation (
    reservation_id VARCHAR(5) PRIMARY KEY,
    reservationDate DATETIME NOT NULL,
    booking_date DATETIME NOT NULL,
    user_id VARCHAR(5),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Ticket Table
CREATE TABLE Ticket (
    ticket_id VARCHAR(5) PRIMARY KEY,
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
    payment_id VARCHAR(5) PRIMARY KEY,
    amount_paid DECIMAL(10,2) NOT NULL,
    ticket_id VARCHAR(5),
    user_id VARCHAR(5),
    paymentMethod ENUM('Mobile money', 'Flexi_Pay') NOT NULL,
    paymentDate DATETIME NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

DESC Admin;

DESC User;

DESC ParkingSlot;

DESC Reservation;

DESC Ticket;

DESC Payment;



