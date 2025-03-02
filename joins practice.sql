CREATE DATABASE smart_parking;
use smart_parking;
--natural joints--
CREATE VIEW AdminParkingSlotDetails AS
SELECT
    admin_id,
    FName,
    Role,
    Slot_id,
    Location,
    Status
FROM
    Admin
NATURAL JOIN
    ParkingSlot;

SELECT* FROM AdminParkingSlotDetails;



--right join for all reservations with users that do not have corresponding users--
CREATE VIEW ReservationsRightJoinUsers AS
SELECT
    r.Reservation_id,
    r.ReservationDate,
    r.Booking_date,
    u.User_id,
    u.FName
FROM
    Reservation r
RIGHT OUTER JOIN
    User u ON r.User_id = u.User_id;

SELECT* FROM ReservationsRightJoinUsers;

CREATE VIEW PaymentsRightJoinTickets AS
SELECT
    p.payment_id,
    p.amount_paid,
    p.PaymentDate,
    p.Status AS PaymentStatus,
    t.Ticket_id,
    t.EntryTime,
    t.Duration,
    t.Baserate,
    t.PenaltyRate,
    t.Status AS TicketStatus
FROM
    Payment p
RIGHT OUTER JOIN
    Ticket t ON p.Ticket_id = t.Ticket_id;

SELECT* FROM PaymentsRightJoinTickets;

--left join for all users with reservations that do not have corresponding reservations--

CREATE VIEW UsersLeftJoinReservations AS
SELECT
    u.User_id,
    u.FName,
    r.Reservation_id,
    r.ReservationDate,
    
FROM
    User u
LEFT OUTER JOIN
    Reservation r ON u.User_id = r.User_id;

SELECT* FROM UsersLeftJoinReservations;

CREATE VIEW TicketsLeftJoinPayments AS
SELECT
    t.Ticket_id,
    t.EntryTime,
    t.Duration,
    t.Baserate,
    t.PenaltyRate,
    t.Status AS TicketStatus,
    p.payment_id,
    p.amount_paid,
    p.PaymentDate,
    p.Status AS PaymentStatus
FROM
    Ticket t
LEFT OUTER JOIN
    Payment p ON t.Ticket_id = p.Ticket_id;

SELECT* FROM TicketsLeftJoinPayments;

UPDATE Reservation
SET reservationDate = NULL, booking_date = NULL
WHERE Reservation_id IN (1, 3, 5);

ALTER TABLE reservation 
MODIFY COLUMN reservationdate DATETIME NOT NULL,
MODIFY COLUMN booking_date DATETIME  NOT NULL;

--full outer joins--

CREATE VIEW FullUsersReservations AS
SELECT
    u.User_id,
    u.FName,
    r.Reservation_id,
    r.ReservationDate,
    r.Booking_date
FROM
    User u
LEFT JOIN
    Reservation r ON u.User_id = r.User_id
UNION
SELECT
    u.User_id,
    u.FName,
    r.Reservation_id,
    r.ReservationDate,
    r.Booking_date
FROM
    User u
RIGHT JOIN
    Reservation r ON u.User_id = r.User_id;

SELECT* FROM FullUsersReservations;

--full outer join for the final ticket after using the service--
CREATE VIEW FullPaymentTicket AS
SELECT
    p.Payment_id,
    p.amount_paid,
    p.PaymentDate,
    t.Ticket_id,
    t.EntryTime,
    t.Duration,
    t.Baserate,
    t.PenaltyRate,
FROM
    Payment p
LEFT JOIN
    Ticket t ON p.Ticket_id = t.Ticket_id
UNION
SELECT
    p.Payment_id,
    p.amount_paid,
    p.PaymentDate,
    t.Ticket_id,
    t.EntryTime,
    t.Duration,
    t.Baserate,
    t.PenaltyRate,
FROM
    Payment p
RIGHT JOIN
    Ticket t ON p.Ticket_id = t.Ticket_id;