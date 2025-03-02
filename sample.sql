use parkingsystem;
INSERT INTO Admin (FName, email, phone, password, Role) VALUES
('Ronald', 'ronald@admin.com', '0706807623', 'ronald123', 'Manager'),
('Nickson', 'nickson@admin.com', '0765432091', 'nickson123', 'Staff'),
('Phillip', 'phillip@admin.com', '0765499321', 'phillip123', 'Staff'),
('Joseph', 'joseph@admin.com', '0765004321', 'joseph123', 'Staff'),
('Angela', 'angela@admin.com', '0706916585', 'aangela123', 'Manager');

-- User Data
INSERT INTO User (FName, Email, Phone, Password, UserType) VALUES
('John Mugabe', 'john@example.com', '0765532091', 'john23', 'Regular'),
('Becky Matovu', 'becky@example.com', '0765432097', 'becky123', 'VIP'),
('Okello Richard', 'okello@example.com', '0764432091', 'okello123', 'Regular'),
('Steve Jobs', 'steve@example.com', '0762432091', 'steve123', 'VIP'),
('Chris Lubogo', 'chris@example.com', '0763432191', 'chris123', 'Regular');

-- Parking Slot Data
INSERT INTO ParkingSlot (location, admin_id, status) VALUES
('Tech_park', 1, 'Available'),
('k_block', 2, 'Occupied'),
('Main_canteen', 1, 'Reserved'),
('OV_block', 2, 'Available'),
('N_block', 3, 'Occupied');

-- Reservation Data
INSERT INTO Reservation (reservationDate, booking_date, user_id) VALUES
(NOW(), NOW() + INTERVAL 1 DAY, 1),
(NOW(), NOW() + INTERVAL 2 DAY, 2),
(NOW(), NOW() + INTERVAL 3 DAY, 3),
(NOW(), NOW() + INTERVAL 4 DAY, 4),
(NOW(), NOW() + INTERVAL 5 DAY, 5);

-- Ticket Data
INSERT INTO Ticket (entryTime, duration, baseRate, penaltyRate, status, reservation_id, slot_id) VALUES
(NOW(), 60, 5.00, 2.00, 'Active', 1, 1),
(NOW(), 120, 10.00, 3.00, 'Paid', 2, 2),
(NOW(), 90, 7.50, 2.50, 'Expired', 3, 3),
(NOW(), 30, 2.50, 1.00, 'Active', 4, 4),
(NOW(), 45, 3.75, 1.50, 'Paid', 5, 5);

-- Payment Data
INSERT INTO Payment (amount_paid, ticket_id, user_id, paymentMethod, paymentDate, status) VALUES
(10000, 2, 2, 'Card', NOW(), 'Completed'),
(7000, 3, 3, 'Cash', NOW(), 'Completed'),
(5000, 4, 4, 'Online', NOW(), 'Pending'),
(9500, 5, 5, 'Card', NOW(), 'Completed'),
(6000, 1, 1, 'Cash', NOW(), 'Failed');
