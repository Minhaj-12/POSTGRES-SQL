-- Step 1: Create the SalesData table
CREATE TABLE SalesData (
    CustomerID INT,
    ProductID CHAR(1),
    PurchaseDate DATE,
    Quantity INT,
    Revenue DECIMAL(10, 2)
);

-- Step 2: Insert the provided data into the table
INSERT INTO SalesData (CustomerID, ProductID, PurchaseDate, Quantity, Revenue)
VALUES 
(1, 'A', '2023-01-01', 5, 100.00),
(2, 'B', '2023-01-02', 3, 50.00),
(3, 'A', '2023-01-03', 2, 30.00),
(4, 'C', '2023-01-03', 1, 20.00),
(1, 'B', '2023-01-04', 4, 80.00);

-- Step 3: Calculate Total Revenue
SELECT 
    SUM(Revenue) AS TotalRevenue
FROM 
    SalesData;

-- Step 4: Calculate Total Sales by Product
SELECT 
    ProductID,
    SUM(Quantity) AS TotalQuantity,
    SUM(Revenue) AS TotalRevenue
FROM 
    SalesData
GROUP BY 
    ProductID
ORDER BY 
    ProductID;

-- Step 5: Find the Top Customer by Revenue
SELECT 
    CustomerID,
    SUM(Revenue) AS TotalRevenue
FROM 
    SalesData
GROUP BY 
    CustomerID
ORDER BY 
    TotalRevenue DESC;
