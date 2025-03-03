
USE ParkingSystem;
--updating the status of parking slots based on their current status
--this is to account for the condition of spcial privelege for certain cars
UPDATE ParkingSlot
SET STATUS = CASE 
    WHEN STATUS = 'Available' THEN 'Reserved' 
    WHEN STATUS = 'Reserved' THEN 'Occupied'
    ELSE STATUS
END
WHERE slot_id = 'A5'; 

--deleting tickets based on their status
--this deletes paid tickets older than one day
DELETE FROM Ticket 
WHERE ticket_id IN (
    SELECT ticket_id 
    FROM Ticket 
    WHERE CASE
        WHEN STATUS = 'Expired' THEN 1
        WHEN STATUS = 'Paid' AND entryTime < DATE('now', '-1 day') THEN 1
        ELSE 0
    END 1
);

-- getting a list of tickets with their status and a message
SELECT 
    ticket_id,
    entryTime,
    duration,
    STATUS,
    CASE 
        WHEN STATUS = 'Active' THEN 'Ticket is in use'
        WHEN STATUS = 'Expired' THEN 'Ticket has expired'
        WHEN STATUS = 'Paid' THEN 'Ticket has been paid for'
        ELSE 'Unknown ticket status'
    END AS ticket_message
FROM Ticket;