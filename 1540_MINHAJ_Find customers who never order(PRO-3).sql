-- Step 1: Create the Customers table
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    NAME VARCHAR(50)
);

-- Step 2: Create the Orders table
CREATE TABLE Orders (
    id INT,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);

-- Step 3: Insert data into the Customers table
INSERT INTO Customers (id, NAME)
VALUES 
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Step 4: Insert data into the Orders table
INSERT INTO Orders (id, customerId)
VALUES 
(2, 1),
(1, 3);

-- Step 5: Query to find customers who never placed an order
SELECT 
    NAME AS Customers
FROM 
    Customers
WHERE 
    id NOT IN (SELECT DISTINCT customerId FROM Orders);
