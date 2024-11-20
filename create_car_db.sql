DROP DATABASE IF EXISTS car_dealership_database;

CREATE DATABASE IF NOT EXISTS car_dealership_database;

USE car_dealership_database;

CREATE TABLE Dealerships (
	DealershipID INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50),
    Address VARCHAR(50),
    phone VARCHAR(12),
    PRIMARY KEY (DealershipID)
    );
    
CREATE TABLE Vehicles (
	VIN VARCHAR(10) NOT NULL UNIQUE,
    Make VARCHAR(20),
    Model VARCHAR(20),
    Color VARCHAR(20),
    Price DECIMAL(9,2),
    Sold BOOLEAN,
    PRIMARY KEY (VIN)
    );
    
CREATE TABLE Inventory (
	DealershipID INTEGER NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(10) NOT NULL,
    PRIMARY KEY (DealershipID, VIN),
    FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
    );
    
CREATE TABLE SalesContracts (
	ContractID INTEGER NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(10) NOT NULL,
    SaleDate DATE,
    TotalPrice DECIMAL(9, 2),
    MonthlyPrice DECIMAL(7, 2),
    PRIMARY KEY (ContractID),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
    );
    
CREATE TABLE LeaseContracts (
	LeaseID INTEGER NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(10) NOT NULL,
    LeaseDate Date,
    TotalPrice DECIMAL(9, 2),
    MonthlyPrice DECIMAL(7, 2),
    PRIMARY KEY (LeaseID),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
    );
    
INSERT INTO Dealerships (`Name`, Address, Phone) VALUES
('Bay Area Motors', '123 Elm St, San Francisco, CA', '415-555-1234'),
('Sunnyvale Autos', '456 Oak St, Sunnyvale, CA', '408-555-5678'),
('East Bay Cars', '789 Maple St, Oakland, CA', '510-555-9012'),
('Golden Gate Dealership', '101 Pine St, San Mateo, CA', '650-555-3456'),
('Peninsula Motors', '202 Birch St, Palo Alto, CA', '650-555-6789');

INSERT INTO Vehicles (VIN, Make, Model, Color, Price, Sold) VALUES
('VIN001', 'Toyota', 'Camry', 'Blue', 25000.00, FALSE),
('VIN002', 'Honda', 'Civic', 'Red', 23000.00, TRUE),
('VIN003', 'Ford', 'Escape', 'White', 28000.00, FALSE),
('VIN004', 'Chevrolet', 'Malibu', 'Black', 27000.00, TRUE),
('VIN005', 'Nissan', 'Altima', 'Silver', 24000.00, FALSE),
('VIN006', 'BMW', 'X3', 'Gray', 45000.00, TRUE),
('VIN007', 'Audi', 'A4', 'Blue', 41000.00, FALSE),
('VIN008', 'Hyundai', 'Elantra', 'Red', 20000.00, TRUE),
('VIN009', 'Kia', 'Sorento', 'Green', 32000.00, FALSE),
('VIN010', 'Tesla', 'Model 3', 'White', 50000.00, TRUE);

INSERT INTO Inventory (DealershipID, VIN) VALUES
(1, 'VIN001'),
(1, 'VIN003'),
(2, 'VIN002'),
(2, 'VIN005'),
(3, 'VIN004'),
(3, 'VIN007'),
(4, 'VIN006'),
(4, 'VIN009'),
(5, 'VIN008'),
(5, 'VIN010');

INSERT INTO SalesContracts (VIN, SaleDate, TotalPrice, MonthlyPrice) VALUES
('VIN002', '2024-01-15', 23000.00, 400.00),
('VIN004', '2024-02-20', 27000.00, 450.00),
('VIN006', '2024-03-10', 45000.00, 800.00),
('VIN008', '2024-04-05', 20000.00, 350.00),
('VIN010', '2024-05-18', 50000.00, 900.00);

INSERT INTO LeaseContracts (VIN, LeaseDate, TotalPrice, MonthlyPrice) VALUES
('VIN003', '2024-01-25', 28000.00, 300.00),
('VIN005', '2024-02-14', 24000.00, 320.00),
('VIN007', '2024-03-22', 41000.00, 500.00),
('VIN001', '2024-04-30', 25000.00, 280.00),
('VIN009', '2024-05-12', 32000.00, 420.00);

