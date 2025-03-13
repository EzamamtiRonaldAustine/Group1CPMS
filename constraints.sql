USE ParkingSystem;
ALTER TABLE User DROP CONSTRAINT user_email;


SELECT*
CREATE VIEW AvailableParkingSlots AS
SELECT 
    ps.SlotID,
    ps.SlotNumber,
    ps.Location,
    ps.Type
FROM ParkingSlot ps
LEFT JOIN Reservation r 
    ON ps.SlotID = r.SlotID 
    AND r.EndTime > CURRENT_TIMESTAMP
    AND r.StartTime <= CURRENT_TIMESTAMP
WHERE r