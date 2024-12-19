-- Step 1: Create the Emails table
CREATE TABLE Emails (
    id INT PRIMARY KEY,
    NAME VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Step 2: Insert data into the Emails table
INSERT INTO Emails (id, NAME, email, phone)
VALUES 
(1, 'Rahul', 'rahul@example.com', '9839473902'),
(2, 'Rohit', 'rohit@example.com', '9883782971'),
(3, 'Suresh', 'rahul@example.com', '7654321098'),
(4, 'Manish', 'manish@example.com', '8927394619'),
(5, 'Amit', 'amit@example.com', '9399303840'),
(6, 'Rahul', 'rahul@example.com', '9737466147');

-- Step 3: Delete duplicate records, keeping the lowest 'id'
DELETE FROM Emails
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Emails
    GROUP BY email
);

-- Step 4: Verify the final table
SELECT * FROM Emails;
