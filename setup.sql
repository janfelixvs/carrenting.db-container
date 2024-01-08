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
    license_plate VARCHAR(255) ,
    mileage INT ,
    brand VARCHAR(255) ,
    model VARCHAR(255) 
);

CREATE TABLE customer (
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) ,
    last_name VARCHAR(255)  ,
    email VARCHAR(255)   UNIQUE,
    password VARCHAR(255)  
);

CREATE TABLE reservation (
    reservationID INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATETIME  ,
    end_date DATETIME  ,
    customerID INT  ,
    carID INT  ,
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (carID) REFERENCES car(carID)
);

CREATE TABLE maintenance (
    maintenanceID INT AUTO_INCREMENT PRIMARY KEY,
    carID INT  ,
    start_date DATETIME,
    end_date DATETIME,
    status VARCHAR(255) ,
    FOREIGN KEY (carID) REFERENCES car(carID)
);

CREATE TABLE employee (
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255)  ,
    last_name VARCHAR(255)  ,
    email VARCHAR(255)   UNIQUE,
    password VARCHAR(255) 
);


CREATE TABLE gps_tracking (
    trackingID INT AUTO_INCREMENT PRIMARY KEY,
    carID INT,
    timestamp DATETIME ,
    location TEXT ,
    FOREIGN KEY (carID) REFERENCES car(carID)
);

SET GLOBAL FOREIGN_KEY_CHECKS=0;

