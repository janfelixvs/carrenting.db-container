CREATE DATABASE IF NOT EXISTS carrenting;
USE carrenting;



CREATE TABLE vehicles (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    Brand VARCHAR(255),
    Model VARCHAR(255),
    FirstRegistration DATE,
    LastMaintenanceDate DATE
);


CREAT TABLE reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    StartTime DATETIME,
    EndTime DATETIME,
    CustomerID INT,
    LicensePlate VARCHAR(255),
)