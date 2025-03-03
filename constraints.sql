USE ParkingSystem;

-- constraints
ALTER Table Admin add constraint admin_email check (email like '%@%');

ALTER table Admin add constraint admin_telno check (length(telno)=10);

ALTER Table User add constraint user_email check (email like '%@%');

ALTER table User add constraint user_telno check (length(telno)=10);


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
ADD CONSTRAINT CK_Payment_Method CHECK (paymentMethod IN ('Mobile money', 'Flexi_Pay'));

ALTER TABLE Reservation 
ADD CONSTRAINT CK_Reservation_Date CHECK (booking_date >= reservationDate);


-- view constraints
SELECT CONSTRAINT_NAME, constraint_Type, TABLE_NAME 
from information_schema.TABLE_CONSTRAINTS where TABLE_NAME='Admin';

SELECT CONSTRAINT_NAME, constraint_Type, TABLE_NAME
from information_schema.TABLE_CONSTRAINTS where TABLE_NAME='User';

SELECT CONSTRAINT_NAME, constraint_Type, TABLE_NAME
from information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='ParkingSlot';

SELECT CONSTRAINT_NAME, constraint_Type, TABLE_NAME
from information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='Reservation';

SELECT CONSTRAINT_NAME, constraint_Type, TABLE_NAME
from information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='Ticket';

SELECT CONSTRAINT_NAME, constraint_Type, TABLE_NAME
from information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='Payment';













