-- Unique Constraints
ALTER TABLE Admin ADD CONSTRAINT UQ_Admin_Email UNIQUE (email);
ALTER TABLE Admin ADD CONSTRAINT UQ_Admin_Phone UNIQUE (phone);
ALTER TABLE User ADD CONSTRAINT UQ_User_Email UNIQUE (Email);
ALTER TABLE User ADD CONSTRAINT UQ_User_Phone UNIQUE (Phone);
ALTER TABLE ParkingSlot ADD CONSTRAINT UQ_ParkingSlot_Location UNIQUE (location);

-- Foreign Key Constraints
ALTER TABLE ParkingSlot 
ADD CONSTRAINT FK_ParkingSlot_Admin FOREIGN KEY (admin_id) REFERENCES Admin(admin_id) ON DELETE SET NULL;

ALTER TABLE Reservation 
ADD CONSTRAINT FK_Reservation_User FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE;

ALTER TABLE Ticket 
ADD CONSTRAINT FK_Ticket_Reservation FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id) ON DELETE SET NULL,
ADD CONSTRAINT FK_Ticket_Slot FOREIGN KEY (slot_id) REFERENCES ParkingSlot(slot_id) ON DELETE CASCADE;

ALTER TABLE Payment 
ADD CONSTRAINT FK_Payment_Ticket FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE,
ADD CONSTRAINT FK_Payment_User FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE;

-- Check Constraints
ALTER TABLE User 
ADD CONSTRAINT CK_UserType CHECK (UserType IN ('Regular', 'VIP'));

ALTER TABLE ParkingSlot 
ADD CONSTRAINT CK_ParkingSlot_Status CHECK (status IN ('Available', 'Occupied', 'Reserved'));

ALTER TABLE Ticket 
ADD CONSTRAINT CK_Ticket_Status CHECK (status IN ('Active', 'Expired', 'Paid')),
ADD CONSTRAINT CK_Ticket_Duration CHECK (duration > 0),
ADD CONSTRAINT CK_Ticket_BaseRate CHECK (baseRate >= 0),
ADD CONSTRAINT CK_Ticket_PenaltyRate CHECK (penaltyRate >= 0);

ALTER TABLE Payment 
ADD CONSTRAINT CK_Payment_Amount CHECK (amount_paid >= 0),
ADD CONSTRAINT CK_Payment_Status CHECK (status IN ('Pending', 'Completed', 'Failed')),
ADD CONSTRAINT CK_Payment_Method CHECK (paymentMethod IN ('Cash', 'Card', 'Online'));

ALTER TABLE Reservation 
ADD CONSTRAINT CK_Reservation_Date CHECK (booking_date >= reservationDate);
