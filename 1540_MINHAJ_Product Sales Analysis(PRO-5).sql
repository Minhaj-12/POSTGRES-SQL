-- Step 1: Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Step 2: Create the Orders table
CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    Sales DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 3: Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Apple', 2.50),
(2, 'Banana', 1.50),
(3, 'Orange', 3.00),
(4, 'Mango', 2.00);

-- Step 4: Insert data into the Orders table
INSERT INTO Orders1 (OrderID, ProductID, Quantity, Sales)
VALUES 
(1, 1, 10, 25.00),
(2, 1, 5, 12.50),
(3, 2, 8, 12.00),
(4, 3, 12, 36.00),
(5, 4, 6, 12.00);

-- Step 5: Query to calculate total sales revenue for each product
SELECT 
    P.ProductName,
    SUM(O.Sales) AS TotalRevenue
FROM 
    Products P
JOIN 
    Orders1 O ON P.ProductID = O.ProductID
GROUP BY 
    P.ProductName
ORDER BY 
    TotalRevenue DESC;
