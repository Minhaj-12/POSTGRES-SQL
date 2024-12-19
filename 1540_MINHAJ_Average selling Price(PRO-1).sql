-- Step 1: Create the table
CREATE TABLE Product_Sales (
    ProductID INT,
    ProductName VARCHAR(50),
    SellingPrice DECIMAL(10, 2)
);

-- Step 2: Insert data into the table
INSERT INTO Product_Sales (ProductID, ProductName, SellingPrice)
VALUES 
(1, 'Product A', 100.00),
(2, 'Product B', 150.00),
(1, 'Product A', 120.00),
(3, 'Product C', 200.00),
(2, 'Product B', 180.00),
(1, 'Product A', 90.00),
(3, 'Product C', 210.00);

-- Step 3: Query to calculate the average selling price for each product
SELECT 
    ProductName,
    ROUND(AVG(SellingPrice), 6) AS AverageSellingPrice
FROM 
    ProductSales
GROUP BY 
    ProductName
ORDER BY 
    AverageSellingPrice DESC;
