-- Step 1: Create the Names table
CREATE TABLE NAMES (
    NAME VARCHAR(100)
);

-- Step 2: Insert data into the Names table
INSERT INTO NAMES (NAME)
VALUES 
('rAVI kUMAR'),
('priya sharma'),
('amit PATEL'),
('NEHA gupta');

-- Step 3: Correct capitalization and update the Names table
UPDATE NAMES
SET NAME = INITCAP(LOWER(NAME));

-- Step 4: Verify the updated table
SELECT * FROM NAMES;
