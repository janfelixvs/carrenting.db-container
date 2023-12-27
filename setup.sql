CREATE DATABASE IF NOT EXISTS carrenting;
USE carrenting;

DROP TABLE IF EXISTS gps_tracking;
DROP TABLE IF EXISTS notification;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS car;

CREATE TABLE car (
    carID INT AUTO_INCREMENT PRIMARY KEY,
    license_plate VARCHAR(255) NULL,
    kilometerstand INT NOT NULL,
    brand VARCHAR(255) NULL,
    model VARCHAR(255) NULL,
    reserved BIT NOT NULL
);

CREATE TABLE customer (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    driver_license_number VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    payment_information TEXT NOT NULL
);

CREATE TABLE reservation (
    reservationID INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    customerID INT NOT NULL,
    carID INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (carID) REFERENCES car(carID)
);

CREATE TABLE maintenance (
    maintenanceID INT AUTO_INCREMENT PRIMARY KEY,
    carID INT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME,
    status VARCHAR(255) DEFAULT 'scheduled',
    FOREIGN KEY (carID) REFERENCES car(carID)
);

CREATE TABLE employee (
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    position VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE notification (
    notificationID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT NOT NULL,
    message TEXT NOT NULL,
    sent_date DATETIME NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE gps_tracking (
    trackingID INT AUTO_INCREMENT PRIMARY KEY,
    carID INT NOT NULL,
    timestamp DATETIME NOT NULL,
    location TEXT NOT NULL,
    FOREIGN KEY (carID) REFERENCES car(carID)
);

