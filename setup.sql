CREATE DATABASE IF NOT EXISTS carrenting;
USE carrenting;

DROP TABLE IF EXISTS gps_tracking;
DROP TABLE IF EXISTS notification;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS car;

CREATE TABLE car
(
    carID         INT AUTO_INCREMENT PRIMARY KEY,
    license_plate VARCHAR(255),
    mileage       INT,
    brand         VARCHAR(255),
    model         VARCHAR(255)
);

CREATE TABLE customer
(
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name  VARCHAR(255),
    email      VARCHAR(255) UNIQUE,
    password   VARCHAR(255)
);

CREATE TABLE reservation
(
    reservationID INT AUTO_INCREMENT PRIMARY KEY,
    start_date    DATETIME,
    end_date      DATETIME,
    customerID    INT,
    carID         INT,
    FOREIGN KEY (customerID) REFERENCES customer (customerID),
    FOREIGN KEY (carID) REFERENCES car (carID)
);

CREATE TABLE maintenance
(
    maintenanceID INT AUTO_INCREMENT PRIMARY KEY,
    carID         INT,
    start_date    DATETIME,
    end_date      DATETIME,
    status        VARCHAR(255),
    FOREIGN KEY (carID) REFERENCES car (carID)
);

CREATE TABLE employee
(
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name  VARCHAR(255),
    email      VARCHAR(255) UNIQUE,
    password   VARCHAR(255)
);


CREATE TABLE gps_tracking
(
    trackingID INT AUTO_INCREMENT PRIMARY KEY,
    carID      INT,
    timestamp  DATETIME,
    location   TEXT,
    FOREIGN KEY (carID) REFERENCES car (carID) ON DELETE CASCADE
);

SET GLOBAL FOREIGN_KEY_CHECKS = 0;



INSERT INTO car (license_plate, mileage, brand, model) VALUES 
('B-RN 4567', 12000, 'BMW', '3 Series'),
('D-MS 8910', 25000, 'Mercedes', 'C Class'),
('F-ST 2345', 5000, 'Ford', 'Mustang'),
('M-UN 6789', 32000, 'Audi', 'A4'),
('K-LN 1234', 15000, 'Volkswagen', 'Golf');


INSERT INTO customer (first_name, last_name, email, password) VALUES 
('Max', 'Müller', 'max.mueller@example.com', 'pass1234'),
('Anna', 'Schmidt', 'anna.schmidt@example.com', 'pass5678'),
('Lukas', 'Bauer', 'lukas.bauer@example.com', 'pass9012'),
('Sarah', 'Weber', 'sarah.weber@example.com', 'pass3456'),
('Julia', 'Meier', 'julia.meier@example.com', 'pass7890');


INSERT INTO reservation (start_date, end_date, customerID, carID) VALUES 
('2024-01-15 08:00:00', '2024-01-20 20:00:00', 1, 2),
('2024-02-01 09:00:00', '2024-02-05 18:00:00', 2, 3);

INSERT INTO maintenance (carID, start_date, end_date, status) VALUES 
(5, '2024-04-25 11:00:00', '2024-04-26 17:00:00', 'Scheduled');

INSERT INTO employee (first_name, last_name, email, password) VALUES 
('Felix', 'Neumann', 'felix.neumann@example.com', 'emp1234'),
('Emilia', 'Fischer', 'emilia.fischer@example.com', 'emp5678'),
('Tobias', 'Schneider', 'tobias.schneider@example.com', 'emp9012'),
('Lena', 'Hoffmann', 'lena.hoffmann@example.com', 'emp3456'),
('Simon', 'Schulz', 'simon.schulz@example.com', 'emp7890');

INSERT INTO gps_tracking (carID, timestamp, location) VALUES 
(1, '2024-01-15 10:30:00', 'Latitude: 35.559567764972144, Longitude: -71.73573082770884'),
(2, '2024-01-20 14:45:00', 'Latitude: -73.01707006461903, Longitude: -30.43413544993905'), 
(3, '2024-02-05 11:00:00', 'Latitude: 58.85137006929659, Longitude: 99.07399886193417'),
(4, '2024-02-15 16:20:00', 'Latitude: 10.23004403042522, Longitude: 101.87207946563973'),
(5, '2024-03-10 09:55:00', 'Latitude: 10.23004403042522, Longitude: 101.87207946563973');
