-- Admin Data 
INSERT INTO Admin (FName, email, phone, password, Role) VALUES ('Alice', 'alice@admin.com', '1234567890', 'pass123', 'Manager'), ('Bob', 'bob@admin.com', '0987654321', 'pass456', 'Staff'), ('Charlie', 'charlie@admin.com', '1112223333', 'pass789', 'Manager');

-- User Data 
INSERT INTO User (FName, Email, Phone, Password, UserType) VALUES ('John Doe', 'john@example.com', '5551112222', 'johnpass', 'Regular'), ('Jane Smith', 'jane@example.com', '5553334444', 'janepass', 'VIP'), ('Mike Brown', 'mike@example.com', '5556667777', 'mikepass', 'Regular'), ('Anna Lee', 'anna@example.com', '5558889999', 'annapass', 'VIP'), ('Chris Green', 'chris@example.com', '5550001111', 'chrispass', 'Regular');

-- Parking Slot Data 
INSERT INTO ParkingSlot (location, admin_id, status) VALUES ('A1', 1, 'Available'), ('A2', 2, 'Occupied'), ('B1', 1, 'Reserved'), ('B2', 2, 'Available'), ('C1', 3, 'Occupied');

-- Reservation Data 
INSERT INTO Reservation (reservationDate, booking_date, user_id) VALUES (NOW(), NOW() + INTERVAL 1 DAY, 1), (NOW(), NOW() + INTERVAL 2 DAY, 2), (NOW(), NOW() + INTERVAL 3 DAY, 3), (NOW(), NOW() + INTERVAL 4 DAY, 4), (NOW(), NOW() + INTERVAL 5 DAY, 5);

-- Ticket Data 
INSERT INTO Ticket (entryTime, duration, baseRate, penaltyRate, status, reservation_id, slot_id) VALUES (NOW(), 60, 5.00, 2.00, 'Active', 1, 1), (NOW(), 120, 10.00, 3.00, 'Paid', 2, 2), (NOW(), 90, 7.50, 2.50, 'Expired', 3, 3), (NOW(), 30, 2.50, 1.00, 'Active', 4, 4), (NOW(), 45, 3.75, 1.50, 'Paid', 5, 5);

-- Payment Data 
INSERT INTO Payment (amount_paid, ticket_id, user_id, paymentMethod, paymentDate, status) VALUES (10.00, 2, 2, 'Card', NOW(), 'Completed'), (7.50, 3, 3, 'Cash', NOW(), 'Completed'), (2.50, 4, 4, 'Online', NOW(), 'Pending'), (3.75, 5, 5, 'Card', NOW(), 'Completed'), (5.00, 1, 1, 'Cash', NOW(), 'Failed');
