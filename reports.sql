use smart_parking;
use parkingsystem;
--List of All Available and Reserved Parking Slots
CREATE VIEW View_Available_Slots AS
SELECT 
    slot_id, 
    location, 
    status
FROM ParkingSlot
WHERE status IN ('Available', 'Reserved');

SELECT * FROM view_available_slots;

--List of Expired or Unpaid Tickets
CREATE VIEW View_Unpaid_Tickets AS
SELECT 
    ticket_id, 
    reservation_id, 
    entryTime, 
    duration, 
    status
FROM Ticket
WHERE status IN ('Expired', 'Active');

SELECT* FROM view_unpaid_tickets;

--Total Revenue Per Payment Method
CREATE VIEW View_Revenue_Report AS
SELECT 
    paymentMethod, 
    SUM(amount_paid) AS total_revenue
FROM Payment
WHERE status = 'Completed'
GROUP BY paymentMethod;

SELECT* FROM View_Revenue_Report;

--Count of Reservations Per User
CREATE VIEW View_User_Reservations AS
SELECT 
    user_id, 
    COUNT(reservation_id) AS total_reservations
FROM Reservation
GROUP BY user_id;

SELECT* FROM View_User_Reservations;

--Parking Slot Count by Status
CREATE VIEW View_Parking_Utilization AS
SELECT 
    status, 
    COUNT(slot_id) AS total_slots
FROM ParkingSlot
GROUP BY status;

SELECT* FROM View_Parking_Utilization;

--Count of Payments Per User
CREATE VIEW View_User_Payment_Count AS
SELECT 
    user_id, 
    COUNT(payment_id) AS total_payments
FROM Payment
GROUP BY user_id;

--Total Slots Per Location

SELECT SUM(location) AS total_slots FROM ParkingSlot;

SELECT * FROM View_Available_Slots;

SELECT * FROM View_Unpaid_Tickets;

SELECT * FROM View_Revenue_Report;

SELECT * FROM View_User_Reservations;

SELECT * FROM View_Parking_Utilization;

SELECT * FROM View_User_Payment_Count;

select * from reservation;

DESC reservation;