DROP DATABASE IF EXISTS cardealership;
CREATE DATABASE cardealership;
USE cardealership;

CREATE TABLE dealerships (
    dealership_ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    color VARCHAR(50),
    make VARCHAR(50),
    model VARCHAR(50),
    odometer INT,
    sold BOOLEAN
);

CREATE TABLE inventory (
    dealership_ID INT,
    VIN VARCHAR(17) PRIMARY KEY,
    FOREIGN KEY (dealership_ID)
        REFERENCES dealerships (dealership_ID),
    FOREIGN KEY (VIN)
        REFERENCES vehicles (VIN)
);

CREATE TABLE sales_contracts (
    contract_ID INT AUTO_INCREMENT PRIMARY KEY,
    dealership_ID INT,
    FOREIGN KEY (dealership_ID)
        REFERENCES dealerships (dealership_ID),
    FOREIGN KEY (VIN)
        REFERENCES vehicles (VIN),
    VIN VARCHAR(17),
    cust_name VARCHAR(50),
    date_sold DATE,
    sale_price DECIMAL(10 , 2 )
);

CREATE TABLE lease_contracts (
    lease_ID INT AUTO_INCREMENT PRIMARY KEY,
    dealership_ID INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_ID)
        REFERENCES dealerships (dealership_ID),
    FOREIGN KEY (VIN)
        REFERENCES vehicles (VIN),
    cust_name VARCHAR(50),
    lease_start DATE,
    lease_end DATE,
    monthly_payment DECIMAL(10 , 2 ),
    mileage_limit INT,
    expected_value DECIMAL(10 , 2 )
);
ALTER TABLE vehicles
ADD COLUMN year INT AFTER model,
ADD COLUMN price DECIMAL(10,2) AFTER year;

INSERT INTO dealerships (name, address, phone)
VALUES 
    ('Radiator Springs Motors', '123 Route 66, Radiator Springs', '555-123-4567'),
    ('Rust-eze Racing Center', '456 Piston Cup Blvd, Motor City', '555-987-6543'),
    ('Dinoco Premium Autos', '789 Champion Way, Los Angeles', '555-456-7890');

INSERT INTO vehicles (VIN, make, model, year, color, price, odometer, sold)
VALUES 
    ('1HGCM82633A004352', 'Stock Car', 'Lightning McQueen', 2006, 'Red', 45000.00, 25000, FALSE),
    ('2FTRX18W1XCA12345', 'Tow Truck', 'Mater', 1955, 'Rusty Brown', 15000.00, 150000, FALSE),
    ('5FNRL38719B123456', 'Porsche', '911 Carrera', 2002, 'Blue', 55000.00, 30000, FALSE),
    ('1G1ZT52823F260456', 'Hudson Hornet', 'Fabulous', 1951, 'Dark Blue', 75000.00, 80000, FALSE),
    ('WBAPH73569A123456', 'Chevy', 'Impala Lowrider', 1959, 'Purple', 38000.00, 45000, FALSE),
    ('JH4KA7532MC001234', 'Ford', 'Motorama Show Car', 1957, 'Turquoise', 32000.00, 55000, FALSE);
    
    INSERT INTO inventory (dealership_ID, VIN)
VALUES 
    (1, '1HGCM82633A004352'),
    (1, '2FTRX18W1XCA12345'),
    (2, '5FNRL38719B123456'),
    (2, '1G1ZT52823F260456'),
    (3, 'WBAPH73569A123456'),
    (1, 'JH4KA7532MC001234');
    
    INSERT INTO lease_contracts (dealership_ID, VIN, cust_name, lease_start, lease_end, monthly_payment, mileage_limit, expected_value)
VALUES 
    (1, '1HGCM82633A004352', 'Lightning McQueen', '2024-01-15', '2027-01-15', 599.99, 12000, 25000.00),
    (1, '2FTRX18W1XCA12345', 'Mater', '2024-03-01', '2026-03-01', 299.99, 15000, 8000.00),
    (2, '5FNRL38719B123456', 'Sally Carrera', '2024-02-10', '2027-02-10', 549.99, 10000, 28000.00),
    (2, '1G1ZT52823F260456', 'Doc Hudson', '2023-12-01', '2026-12-01', 699.99, 8000, 35000.00),
    (3, 'WBAPH73569A123456', 'Ramone', '2024-04-20', '2026-04-20', 449.99, 12000, 22000.00),
    (1, 'JH4KA7532MC001234', 'Flo', '2024-05-15', '2027-05-15', 399.99, 10000, 18000.00);
