DROP DATABASE IF EXISTS TRAVEL_AGENCY;
CREATE SCHEMA TRAVEL_AGENCY;
USE TRAVEL_AGENCY;





DROP TABLE IF EXISTS Tour_Guide;
CREATE TABLE IF NOT EXISTS Tour_Guide
(
  Guide_ID INT AUTO_INCREMENT NOT NULL,
  First_Name VARCHAR(15) NOT NULL,
  Second_Name VARCHAR(15) NOT NULL,
  Identity_Type VARCHAR(30) NOT NULL,
  Identity_Number VARCHAR(15) NOT NULL,
  Gender CHAR(1) NOT NULL,
  Contact_Number INT NOT NULL,
  Rating FLOAT,
  Serving_Destination VARCHAR(30) NOT NULL,
  Availability_Status INT NOT NULL,
  PRIMARY KEY (Guide_ID)
);

DROP TABLE IF EXISTS Travel_Agents;
CREATE TABLE IF NOT EXISTS Travel_Agents
(
  Agent_ID INT AUTO_INCREMENT NOT NULL,
  First_Name VARCHAR(15) NOT NULL,
  Second_Name VARCHAR(15) NOT NULL,
  Identity_Type VARCHAR(30) NOT NULL,
  Identity_Number VARCHAR(15) NOT NULL,
  Contact_Number INT NOT NULL,
  PRIMARY KEY (Agent_ID)
);

DROP TABLE IF EXISTS Tour_Packages;
CREATE TABLE IF NOT EXISTS Tour_Packages
(
  Package_ID INT AUTO_INCREMENT NOT NULL,
  Destination VARCHAR(30) NOT NULL,
  Days INT NOT NULL,
  Nights INT NOT NULL,
  Price INT NOT NULL,
  PRIMARY KEY (Package_ID)
);

DROP TABLE IF EXISTS Customizable_Places;
CREATE TABLE IF NOT EXISTS Customizable_Places
(
  Place_ID INT AUTO_INCREMENT NOT NULL,
  Destination_name VARCHAR(50) NOT NULL,
  Place_Name VARCHAR(50) NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (Place_ID)
);

DROP TABLE IF EXISTS Customizable_Transport;
CREATE TABLE IF NOT EXISTS Customizable_Transport
(
  Transport_ID INT AUTO_INCREMENT NOT NULL,
  Source_Location VARCHAR(30) NOT NULL,
  Destination_Location VARCHAR(30) NOT NULL,
  Duration INT NOT NULL,
  Transportation_Mode VARCHAR(15) NOT NULL,
  Transport_Price INT NOT NULL,
  PRIMARY KEY (Transport_ID)
);

DROP TABLE IF EXISTS Customizable_Hotel;
CREATE TABLE IF NOT EXISTS Customizable_Hotel
(
  Hotel_ID INT AUTO_INCREMENT NOT NULL,
  Hotel_Name VARCHAR(50) NOT NULL,
  Hotel_Rating FLOAT,
  Day_Price INT NOT NULL,
  Night_Price INT NOT NULL,
  PRIMARY KEY (Hotel_ID)
);

DROP TABLE IF EXISTS Offers1;
CREATE TABLE IF NOT EXISTS Offers1
(
  Offer_ID INT AUTO_INCREMENT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Offer_ID, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Customizable_Transport_Booking1;
CREATE TABLE IF NOT EXISTS Customizable_Transport_Booking1
(
  Transport_Booking_ID INT AUTO_INCREMENT NOT NULL,
  Transport_ID INT NOT NULL,
  PRIMARY KEY (Transport_Booking_ID, Transport_ID),
  FOREIGN KEY (Transport_ID) REFERENCES Customizable_Transport(Transport_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Customizable_Hotel_booking1;
CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking1
(
  Hotel_Booking_ID INT AUTO_INCREMENT NOT NULL,
  Hotel_ID INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID, Hotel_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Customizable_Hotel(Hotel_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Customized_Bookings1;
CREATE TABLE IF NOT EXISTS Customized_Bookings1
(
  Custom_Booking_ID INT AUTO_INCREMENT NOT NULL,
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  Place_ID INT NOT NULL,
  PRIMARY KEY (Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID),
  FOREIGN KEY (Transport_Booking_ID, Transport_ID) REFERENCES Customizable_Transport_Booking1(Transport_Booking_ID, Transport_ID) ON DELETE CASCADE,
  FOREIGN KEY (Hotel_Booking_ID, Hotel_ID) REFERENCES Customizable_Hotel_booking1(Hotel_Booking_ID, Hotel_ID) ON DELETE CASCADE,
  FOREIGN KEY (Place_ID) REFERENCES Customizable_Places(Place_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Languages_Spoken;
CREATE TABLE IF NOT EXISTS Languages_Spoken
(
  Languages_Spoken VARCHAR(20) NOT NULL,
  Guide_ID INT NOT NULL,
  PRIMARY KEY (Languages_Spoken, Guide_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Places;
CREATE TABLE IF NOT EXISTS Places
(
  Places VARCHAR(50) NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Places, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Tourists_IDs;
CREATE TABLE IF NOT EXISTS Tourists_IDs
(
  Tourists_IDs INT AUTO_INCREMENT NOT NULL,
  Custom_Booking_ID INT NOT NULL,
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  Place_ID INT NOT NULL,
  PRIMARY KEY (Tourists_IDs),
  FOREIGN KEY (Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID) REFERENCES Customized_Bookings1(Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Assigned_to;
CREATE TABLE IF NOT EXISTS Assigned_to
(
  Guide_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Guide_ID, Package_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID) ON DELETE CASCADE,
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Payments2;
CREATE TABLE IF NOT EXISTS Payments2
(
  Payment_ID INT AUTO_INCREMENT NOT NULL,
  Booking_Type VARCHAR(15) NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Payment_Amount INT NOT NULL,
  Payment_Method INT NOT NULL,
  PRIMARY KEY (Payment_ID)
);

DROP TABLE IF EXISTS Bookings2;
CREATE TABLE IF NOT EXISTS Bookings2
(
  Booking_ID INT AUTO_INCREMENT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Total_Amount INT NOT NULL,
  Amount_Paid INT NOT NULL,
  Amount_Due INT NOT NULL,
  PRIMARY KEY (Booking_ID)
);

DROP TABLE IF EXISTS Offers2;
CREATE TABLE IF NOT EXISTS Offers2
(
  Offer_ID INT AUTO_INCREMENT NOT NULL,
  Offer_Name VARCHAR(30) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Discount_Percentage INT NOT NULL,
  Status INT NOT NULL,
  PRIMARY KEY (Offer_ID)
);

DROP TABLE IF EXISTS Reviews_and_Feedback2;
CREATE TABLE IF NOT EXISTS Reviews_and_Feedback2
(
  Review_ID INT AUTO_INCREMENT NOT NULL,
  Rating FLOAT,
  Comments VARCHAR(100) NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  PRIMARY KEY (Review_ID)
);

DROP TABLE IF EXISTS Customizable_Transport_Booking2;
CREATE TABLE IF NOT EXISTS Customizable_Transport_Booking2
(
  Transport_Booking_ID INT AUTO_INCREMENT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Hour INT NOT NULL,
  Minute INT NOT NULL,
  PRIMARY KEY (Transport_Booking_ID)
);

DROP TABLE IF EXISTS Customizable_Hotel_booking2;
CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking2
(
  Hotel_Booking_ID INT AUTO_INCREMENT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Days INT NOT NULL,
  Nights INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID)
);

DROP TABLE IF EXISTS Tourists;
CREATE TABLE IF NOT EXISTS Tourists
(
  Tourist_ID INT AUTO_INCREMENT NOT NULL,
  First_Name VARCHAR(15) NOT NULL,
  Second_Name VARCHAR(15) NOT NULL,
  Identity_Type VARCHAR(30) NOT NULL,
  Identity_Number VARCHAR(15) NOT NULL,
  House_Number INT NOT NULL,
  Postal_Code INT NOT NULL,
  Street_Address VARCHAR(50) NOT NULL,
  Contact_Number INT NOT NULL,
  Agent_ID INT NOT NULL,
  PRIMARY KEY (Tourist_ID),
  FOREIGN KEY (Agent_ID) REFERENCES Travel_Agents(Agent_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Reviews_and_Feedback1;
CREATE TABLE IF NOT EXISTS Reviews_and_Feedback1
(
  Review_ID INT AUTO_INCREMENT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Review_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID) ON DELETE CASCADE,
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Bookings1;
CREATE TABLE IF NOT EXISTS Bookings1
(
  Booking_ID INT AUTO_INCREMENT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID) ON DELETE CASCADE,
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Payments1;
CREATE TABLE IF NOT EXISTS Payments1
(
  Payment_ID INT AUTO_INCREMENT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Booking_ID, Tourist_ID, Package_ID) REFERENCES Bookings1(Booking_ID, Tourist_ID, Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Bookings_Tourists_IDs;
CREATE TABLE IF NOT EXISTS Bookings_Tourists_IDs
(
  Tourists_IDs INT AUTO_INCREMENT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Tourists_IDs),
  FOREIGN KEY (Booking_ID, Tourist_ID, Package_ID) REFERENCES Bookings1(Booking_ID, Tourist_ID, Package_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Booking_Handler;
CREATE TABLE IF NOT EXISTS Booking_Handler
(
  Payment_ID INT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  Agent_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID, Agent_ID),
  FOREIGN KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID) REFERENCES Payments1(Payment_ID, Booking_ID, Tourist_ID, Package_ID) ON DELETE CASCADE,
  FOREIGN KEY (Agent_ID) REFERENCES Travel_Agents(Agent_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Customized_Bookings2;
CREATE TABLE IF NOT EXISTS Customized_Bookings2
(
  Custom_Booking_ID INT AUTO_INCREMENT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Language VARCHAR(20) NOT NULL,
  Gender CHAR(1) NOT NULL,
  Amount_Paid INT NOT NULL,
  Amount_Due INT NOT NULL,
  Tourist_ID INT NOT NULL,
  PRIMARY KEY (Custom_Booking_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID) ON DELETE CASCADE
);





-- Insert data into Tour_Guide table
INSERT INTO Tour_Guide (First_Name, Second_Name, Identity_Type, Identity_Number, Gender, Contact_Number, Rating, Serving_Destination, Availability_Status)
VALUES
  ('John', 'Doe', 'Passport', 'ABC123456', 'M', 123456789, 4.5, 'Paris', 1),
  ('Jane', 'Smith', 'Driver License', 'XYZ987654', 'F', 987654321, 4.2, 'Tokyo', 1),
  ('Mike', 'Johnson', 'Passport', 'PQR789012', 'M', 555555555, 4.8, 'New York', 1),
  ('Emily', 'Davis', 'Driver License', 'LMN456789', 'F', 999888777, 4.0, 'Arusha', 1),
  ('Chris', 'Brown', 'Passport', 'DEF345678', 'M', 111222333, 4.6, 'Cusco', 1);

-- Insert data into Travel_Agents table
INSERT INTO Travel_Agents (First_Name, Second_Name, Identity_Type, Identity_Number, Contact_Number)
VALUES
  ('Emma', 'Johnson', 'Passport', 'AGT123456', 123456789),
  ('Daniel', 'Miller', 'Driver License', 'AGT987654', 987654321),
  ('Olivia', 'Clark', 'Passport', 'AGT789012', 555555555),
  ('William', 'Davis', 'Driver License', 'AGT456789', 999888777),
  ('Sophia', 'Wilson', 'Passport', 'AGT345678', 111222333);

-- Insert data into Tour_Packages table
INSERT INTO Tour_Packages (Destination, Days, Nights, Price)
VALUES
  ('Paris', 5, 4, 2000),
  ('Tokyo', 7, 6, 3000),
  ('New York', 4, 3, 1500),
  ('Arusha', 8, 7, 4000),
  ('Cusco', 6, 5, 2500);

-- Insert data into Customizable_Places table
INSERT INTO Customizable_Places (Destination_name, Place_Name, Cost)
VALUES
  ('Paris', 'Eiffel Tower', 100),
  ('Tokyo', 'Mount Fuji', 120),
  ('New York', 'Statue of Liberty', 80),
  ('Arusha', 'Serengeti National Park', 200),
  ('Cusco', 'Machu Picchu', 150);

-- Insert data into Customizable_Transport table
INSERT INTO Customizable_Transport (Source_Location, Destination_Location, Duration, Transportation_Mode, Transport_Price)
VALUES
  ('Paris', 'Nice', 3, 'Train', 50),
  ('Tokyo', 'Osaka', 2, 'Bullet Train', 100),
  ('New York', 'Washington DC', 4, 'Bus', 30),
  ('Arusha', 'Zanzibar', 5, 'Flight', 200),
  ('Cusco', 'Lima', 2, 'Car', 80);

-- Insert data into Customizable_Hotel table
INSERT INTO Customizable_Hotel (Hotel_Name, Hotel_Rating, Day_Price, Night_Price)
VALUES
  ('Parisian Suites', 4.5, 150, 100),
  ('Tokyo Grand Hotel', 4.2, 200, 150),
  ('NYC View Hotel', 4.8, 120, 80),
  ('Serengeti Safari Lodge', 4.0, 250, 200),
  ('Machu Picchu Inn', 4.6, 180, 120);

-- Insert data into Offers1 table
INSERT INTO Offers1 (Package_ID)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

-- Insert data into Customizable_Transport_Booking1 table
INSERT INTO Customizable_Transport_Booking1 (Transport_ID)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

-- Insert data into Customizable_Hotel_booking1 table
INSERT INTO Customizable_Hotel_booking1 (Hotel_ID)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

-- Insert data into Languages_Spoken table
INSERT INTO Languages_Spoken (Languages_Spoken, Guide_ID)
VALUES
  ('English', 1),
  ('Japanese', 2),
  ('Spanish', 3),
  ('Swahili', 4),
  ('Quechua', 5);

-- Insert data into Places table
INSERT INTO Places (Places, Package_ID)
VALUES
  ('Tokyo Skytree ', 2),
  ('Tokyo Disneyland', 2),
  ('paris skytree', 1),
  ('paris mountain', 1),
  ('tourist palace', 3);

-- Insert data into Tourists table
INSERT INTO Tourists (First_Name, Second_Name, Identity_Type, Identity_Number, House_Number, Postal_Code, Street_Address, Contact_Number, Agent_ID)
VALUES
  ('Michael', 'Smith', 'Passport', 'TID123456', 123, 56789, '123 Main St', 987654321, 1),
  ('Sophie', 'Johnson', 'Driver License', 'TID987654', 456, 98765, '456 Oak St', 123456789, 2),
  ('Oliver', 'Brown', 'Passport', 'TID789012', 789, 34567, '789 Pine St', 555555555, 3),
  ('Emma', 'Davis', 'Driver License', 'TID456789', 567, 12345, '567 Elm St', 999888777, 4),
  ('Lucas', 'Miller', 'Passport', 'TID345678', 678, 23456, '678 Maple St', 111222333, 5);

-- Insert data into Customized_Bookings1 table
INSERT INTO Customized_Bookings1 (Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID)
VALUES
  (1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5);

-- Insert data into Tourists_IDs table
INSERT INTO Tourists_IDs (Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID)
VALUES
  (1, 1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5, 5);

-- Insert data into Assigned_to table
INSERT INTO Assigned_to (Guide_ID, Package_ID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- Insert data into Payments2 table
INSERT INTO Payments2 (Booking_Type, Day, Month, Year, Payment_Amount, Payment_Method)
VALUES
  ('Customized', 1, 12, 2023, 500, 1),
  ('Package', 2, 12, 2023, 1000, 2),
  ('Customized', 3, 12, 2023, 700, 1),
  ('Package', 4, 12, 2023, 1200, 2),
  ('Customized', 5, 12, 2023, 600, 1);

-- Insert data into Bookings2 table
INSERT INTO Bookings2 (Day, Month, Year, Total_Amount, Amount_Paid, Amount_Due)
VALUES
  (1, 12, 2023, 1500, 500, 1000),
  (2, 12, 2023, 2500, 1000, 1500),
  (3, 12, 2023, 1800, 700, 1100),
  (4, 12, 2023, 3000, 1200, 1800),
  (5, 12, 2023, 2000, 600, 1400);

-- Insert data into Offers2 table
INSERT INTO Offers2 (Offer_Name, Description, Discount_Percentage, Status)
VALUES
  ('Winter Special', 'Enjoy a discount on customized tours!', 10, 1),
  ('Early Bird Package', 'Book early and get a special discount on packages!', 15, 1),
  ('Summer Escape', 'Special offers on selected destinations for summer!', 8, 1),
  ('Adventure Lovers', 'Exciting discounts for adventure packages!', 12, 1),
  ('Family Fun', 'Discounts for family-friendly tours!', 10, 1);

-- Insert data into Reviews_and_Feedback2 table
INSERT INTO Reviews_and_Feedback2 (Rating, Comments, Day, Month, Year)
VALUES
  (4.5, 'Great experience with the tour guide!', 1, 12, 2023),
  (4.0, 'Enjoyed the package tour, highly recommended!', 2, 12, 2023),
  (4.8, 'Amazing customized tour, exceeded expectations!', 3, 12, 2023),
  (4.2, 'Safari experience was fantastic!', 4, 12, 2023),
  (4.6, 'Machu Picchu tour was a dream come true!', 5, 12, 2023);

-- Insert data into Customizable_Transport_Booking2 table
INSERT INTO Customizable_Transport_Booking2 (Day, Month, Year, Hour, Minute)
VALUES
  (1, 12, 2023, 10, 30),
  (2, 12, 2023, 12, 45),
  (3, 12, 2023, 14, 15),
  (4, 12, 2023, 9, 0),
  (5, 12, 2023, 11,  45);

-- Insert data into Customizable_Hotel_booking2 table
INSERT INTO Customizable_Hotel_booking2 (Day, Month, Year, Days, Nights)
VALUES
  (1, 12, 2023, 3, 2),
  (2, 12, 2023, 4, 3),
  (3, 12, 2023, 2, 1),
  (4, 12, 2023, 5, 4),
  (5, 12, 2023, 3, 2);

-- Insert data into Reviews_and_Feedback1 table
INSERT INTO Reviews_and_Feedback1 (Tourist_ID, Package_ID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- Insert data into Bookings1 table
INSERT INTO Bookings1 (Tourist_ID, Package_ID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- Insert data into Payments1 table
INSERT INTO Payments1 (Booking_ID, Tourist_ID, Package_ID)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);

-- Insert data into Bookings_Tourists_IDs table
INSERT INTO Bookings_Tourists_IDs (Booking_ID, Tourist_ID, Package_ID)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);

-- Insert data into Booking_Handler table
INSERT INTO Booking_Handler (Payment_ID, Booking_ID, Tourist_ID, Package_ID, Agent_ID)
VALUES
  (1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5);

-- Insert data into Customized_Bookings2 table
INSERT INTO Customized_Bookings2 (Day, Month, Year, Language, Gender, Amount_Paid, Amount_Due, Tourist_ID)
VALUES
  (1, 12, 2023, 'English', 'M', 500, 1000, 1),
  (2, 12, 2023, 'Japanese', 'F', 1000, 1500, 2),
  (3, 12, 2023, 'Spanish', 'M', 700, 1100, 3),
  (4, 12, 2023, 'Swahili', 'F', 1200, 1800, 4),
  (5, 12, 2023, 'Quechua', 'M', 600, 1400, 5);

