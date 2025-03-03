
use parkingsystem;
INSERT INTO Admin VALUES
('A1','Ronald', 'ronald@admin.com', '0706807623', 'ronald123', 'Manager'),
('A2','Nickson', 'nickson@admin.com', '0765432091', 'nickson123', 'Staff'),
('A3','Phillip', 'phillip@admin.com', '0765499321', 'phillip123', 'Staff'),
('A4','Joseph', 'joseph@admin.com', '0765004321', 'joseph123', 'Staff'),
('A5','Angela', 'angela@admin.com', '0706916585', 'aangela123', 'Manager');

-- User Data
INSERT INTO User VALUES
('C1','John Mugabe', 'john@example.com', '0765532091', 'john23', 'Regular'),
('C2','Becky Matovu', 'becky@example.com', '0765432097', 'becky123', 'VIP'),
('C3','Okello Richard', 'okello@example.com', '0764432091', 'okello123', 'Regular'),
('C4','Steve Jobs', 'steve@example.com', '0762432091', 'steve123', 'VIP'),
('C5','Chris Lubogo', 'chris@example.com', '0763432191', 'chris123', 'Regular');

-- Parking Slot Data
INSERT INTO ParkingSlot  VALUES
('S1','Tech_park', 'A1', 'Available'),
('S2','k_block', 'A2', 'Occupied'),
('S3','Main_canteen', 'A1', 'Reserved'),
('S4','OV_block', 'A2', 'Available'),
('S5','N_block', 'A3', 'Occupied');

-- Reservation Data
INSERT INTO Reservation VALUES
('R1',NOW(), NOW() + INTERVAL 1 DAY, 'C1'),
('R2',NOW(), NOW() + INTERVAL 2 DAY, 'C2'),
('R3',NOW(), NOW() + INTERVAL 3 DAY, 'C3'),
('R4',NOW(), NOW() + INTERVAL 4 DAY, 'C4'),
('R5',NOW(), NOW() + INTERVAL 5 DAY, 'C5');

-- Ticket Data
INSERT INTO Ticket VALUES
('T1',NOW(), 60, 5.00, 2.00, 'Active', 'R1', 'S1'),
('T2',NOW(), 120, 10.00, 3.00, 'Paid', 'R2', 'S2'),
('T3',NOW(), 90, 7.50, 2.50, 'Expired', 'R3', 'S3'),
('T4',NOW(), 30, 2.50, 1.00, 'Active', 'R4', 'S4'),
('T5',NOW(), 45, 3.75, 1.50, 'Paid', 'R5', 'S5');

-- Payment Data
INSERT INTO Payment  VALUES
('P1',10000, 'T2', 'C2', 'Mobile money', NOW(), 'Completed'),
('P2',7000, 'T3', 'C3', 'Mobile money', NOW(), 'Completed'),
('P3',5000, 'T4', 'C4', 'Flexi_Pay', NOW(), 'Pending'),
('P4',9500, 'T5', 'C5', 'Flexi_Pay', NOW(), 'Completed'),
('P5',6000, 'T1', 'C1', 'Mobile money', NOW(), 'Failed');

SELECT * FROM Admin;

SELECT * FROM User;

SELECT * FROM ParkingSlot;

SELECT * FROM Reservation;

SELECT * FROM Ticket;

SELECT * FROM Payment;
