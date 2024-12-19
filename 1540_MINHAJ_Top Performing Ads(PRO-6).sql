-- Step 1: Create the Ads table
CREATE TABLE Ads (
    AdID INT PRIMARY KEY,
    VIEWS INT,
    Clicks INT,
    COST DECIMAL(10, 2)
);

-- Step 2: Insert the provided data into the Ads table
INSERT INTO Ads (AdID, VIEWS, Clicks, COST)
VALUES 
(1, 1000, 50, 20.5),
(2, 800, 30, 15.2),
(3, 1200, 80, 25.7),
(4, 600, 20, 10.9),
(5, 1500, 120, 40.3);

-- Step 3: Calculate CTR and retrieve top-performing ads
SELECT 
    AdID,
    ROUND((Clicks::DECIMAL / VIEWS) * 100, 1) || '%' AS CTR,
    VIEWS,
    Clicks,
    COST
FROM 
    Ads
ORDER BY 
    (Clicks::DECIMAL / VIEWS) DESC;
