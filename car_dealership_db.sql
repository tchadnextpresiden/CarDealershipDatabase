DROP DATABASE IF EXISTS CarDealershipDatabase;
CREATE DATABASE CarDealershipDatabase;
USE CarDealershipDatabase;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    address       VARCHAR(50) NOT NULL,
    phone         VARCHAR(12) NOT NULL
);

CREATE TABLE vehicles (
    VIN        VARCHAR(17) PRIMARY KEY,
    make       VARCHAR(50) NOT NULL,
    model      VARCHAR(50) NOT NULL,
    year       INT         NOT NULL,
    color      VARCHAR(30) NOT NULL,
    mileage    INT         NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    sold       TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    VIN           VARCHAR(17) NOT NULL,
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    VIN            VARCHAR(17) NOT NULL,
    dealership_id  INT NOT NULL,
    customer_name  VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(15) NOT NULL,
    sale_price     DECIMAL(10,2) NOT NULL,
    sale_date      DATE NOT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

CREATE TABLE lease_contracts (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    VIN             VARCHAR(17) NOT NULL,
    dealership_id   INT NOT NULL,
    customer_name   VARCHAR(100) NOT NULL,
    customer_phone  VARCHAR(15) NOT NULL,
    monthly_payment DECIMAL(10,2) NOT NULL,
    lease_start     DATE NOT NULL,
    lease_end       DATE NOT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Downtown Motors', '123 Main St', '214-555-1000'),
('Highway Auto Center', '456 Hwy 80', '214-555-2000'),
('Cityline Cars', '789 Oak Ave', '214-555-3000');

INSERT INTO vehicles (VIN, make, model, year, color, mileage, price, sold) VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 2020, 'Blue', 15000, 22000.00, 1),
('1FAFP404X1F123456', 'Ford', 'Mustang', 2019, 'Red', 23000, 28000.00, 0),
('2T1BURHE0FC987654', 'Toyota', 'Corolla', 2021, 'White', 8000, 19000.00, 0),
('3VWFE21C04M765432', 'VW', 'Jetta', 2018, 'Black', 32000, 15000.00, 1),
('5NPE24AF4FH123789', 'Hyundai', 'Sonata', 2022, 'Gray', 5000, 25000.00, 0),
('1G1BE5SM5H123321', 'Chevy', 'Cruze', 2017, 'Red', 40000, 13000.00, 0);

INSERT INTO inventory VALUES
(1, '1HGCM82633A004352'),
(1, '2T1BURHE0FC987654'),
(2, '1FAFP404X1F123456'),
(2, '3VWFE21C04M765432'),
(3, '5NPE24AF4FH123789'),
(3, '1G1BE5SM5H123321');

INSERT INTO sales_contracts (VIN, dealership_id, customer_name, customer_phone, sale_price, sale_date) VALUES
('1HGCM82633A004352', 1, 'John Smith', '972-555-1111', 21500.00, '2024-05-15'),
('3VWFE21C04M765432', 2, 'Maria Lopez', '972-555-2222', 14800.00, '2024-06-10');

INSERT INTO lease_contracts (VIN, dealership_id, customer_name, customer_phone, monthly_payment, lease_start, lease_end) VALUES
('5NPE24AF4FH123789', 3, 'Alex Johnson', '972-555-3333', 350.00, '2024-07-01', '2027-06-30'),
('2T1BURHE0FC987654', 1, 'Sara Miller', '972-555-4444', 320.00, '2024-03-01', '2027-02-28');
