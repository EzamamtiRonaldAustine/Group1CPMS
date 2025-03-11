
USE ParkingSystem;
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

--left outer join--
CREATE VIEW left_join AS
SELECT
    p.Payment_id,
    p.amount_paid,
    p.PaymentDate,
    t.Ticket_id,
    t.EntryTime,
    t.Duration,
    t.Baserate,
    t.PenaltyRate
FROM
    Payment p
LEFT JOIN
    Ticket t ON p.Ticket_id = t.Ticket_id;

SELECT*FROM left_join;

--right outer join--
CREATE VIEW right_join AS
SELECT
    p.Payment_id,
    p.amount_paid,
    p.PaymentDate,
    t.Ticket_id,
    t.EntryTime,
    t.Duration,
    t.Baserate,
    t.PenaltyRate
FROM
    Payment p
RIGHT JOIN
    Ticket t ON p.Ticket_id = t.Ticket_id;

SELECT*FROM right_join;


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
    t.PenaltyRate
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
    t.PenaltyRate
FROM
    Payment p
RIGHT JOIN
    Ticket t ON p.Ticket_id = t.Ticket_id;

SELECT* FROM FullPaymentTicket;
