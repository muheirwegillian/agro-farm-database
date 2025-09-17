-- Farm Management System Database
-- Created for submission

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS FarmDB;
USE FarmDB;

-- 2. Create Tables
CREATE TABLE Farmers (
    farmer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    farm_name VARCHAR(100)
);

CREATE TABLE Farms (
    farm_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT NOT NULL,
    location VARCHAR(100) NOT NULL,
    size_acres DECIMAL(8,2) NOT NULL,
    farm_type VARCHAR(50),
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id) ON DELETE CASCADE
);

CREATE TABLE Crops (
    crop_id INT AUTO_INCREMENT PRIMARY KEY,
    crop_name VARCHAR(50) NOT NULL UNIQUE,
    crop_type VARCHAR(50),
    planting_season VARCHAR(50)
);

CREATE TABLE FarmCrops (
    farm_id INT NOT NULL,
    crop_id INT NOT NULL,
    planted_date DATE,
    harvest_date DATE,
    PRIMARY KEY (farm_id, crop_id),
    FOREIGN KEY (farm_id) REFERENCES Farms(farm_id) ON DELETE CASCADE,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id) ON DELETE CASCADE
);

CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    equipment_name VARCHAR(100) NOT NULL,
    purchase_date DATE,
    condition_status VARCHAR(50),
    FOREIGN KEY (farm_id) REFERENCES Farms(farm_id) ON DELETE CASCADE
);

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    crop_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    price_per_unit DECIMAL(10,2) NOT NULL,
    total_amount AS (quantity * price_per_unit) PERSISTENT,
    FOREIGN KEY (farm_id) REFERENCES Farms(farm_id) ON DELETE CASCADE,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id) ON DELETE CASCADE
);

-- 3. Sample Data
INSERT INTO Farmers (first_name, last_name, email, phone, farm_name)
VALUES
('John', 'Doe', 'john@example.com', '0712345678', 'Green Acres'),
('Mary', 'Smith', 'mary@example.com', '0709876543', 'Sunny Fields');

INSERT INTO Farms (farmer_id, location, size_acres, farm_type)
VALUES
(1, 'Kampala', 15.5, 'Vegetable Farm'),
(2, 'Jinja', 25.0, 'Mixed Crops');

INSERT INTO Crops (crop_name, crop_type, planting_season)
VALUES
('Maize', 'Grain', 'March-May'),
('Tomato', 'Vegetable', 'January-April'),
('Coffee', 'Cash Crop', 'October-December');

INSERT INTO FarmCrops (farm_id, crop_id, planted_date, harvest_date)
VALUES
(1, 2, '2025-01-10', '2025-04-15'),
(2, 1, '2025-03-05', '2025-06-30'),
(2, 3, '2025-10-01', '2026-02-28');

INSERT INTO Equipment (farm_id, equipment_name, purchase_date, condition_status)
VALUES
(1, 'Tractor', '2023-03-15', 'Good'),
(2, 'Irrigation Pump', '2024-07-20', 'Excellent');

INSERT INTO Sales (farm_id, crop_id, sale_date, quantity, price_per_unit)
VALUES
(1, 2, '2025-04-20', 500.0, 2.5),
(2, 1, '2025-07-01', 1000.0, 1.8),
(2, 3, '2026-02-28', 200.0, 5.0);
