-- Step 1: Create the BankTransactions table
CREATE TABLE BankTransactions (
    AccountNumber INT,
    AccountHolderName VARCHAR(50),
    TransactionDate DATE,
    TransactionType VARCHAR(20),
    TransactionAmount DECIMAL(10, 2)
);

-- Step 2: Insert the transaction data into the table
INSERT INTO BankTransactions (AccountNumber, AccountHolderName, TransactionDate, TransactionType, TransactionAmount)
VALUES 
(1001, 'Ravi Sharma', '2023-07-01', 'Deposit', 5000.00),
(1001, 'Ravi Sharma', '2023-07-05', 'Withdrawal', 1000.00),
(1001, 'Ravi Sharma', '2023-07-10', 'Deposit', 2000.00),
(1002, 'Priya Gupta', '2023-07-02', 'Deposit', 3000.00),
(1002, 'Priya Gupta', '2023-07-08', 'Withdrawal', 500.00),
(1003, 'Vikram Patel', '2023-07-04', 'Deposit', 10000.00),
(1003, 'Vikram Patel', '2023-07-09', 'Withdrawal', 2000.00);

-- Step 3: Query to calculate the total balance for each account
