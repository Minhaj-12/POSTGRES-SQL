CREATE TABLE Users (
    users_id INT PRIMARY KEY,
    banned VARCHAR(3),
    ROLE VARCHAR(10)
);

CREATE TABLE Trips (
    id INT PRIMARY KEY,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(20),
    request_at DATE
);

-- Insert data into Users table
INSERT INTO Users (users_id, banned, ROLE) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

-- Insert data into Trips table
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2023-07-12'),
(2, 2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
(3, 3, 12, 6, 'completed', '2023-07-12'),
(4, 4, 13, 6, 'cancelled_by_client', '2023-07-12'),
(5, 1, 10, 1, 'completed', '2023-07-13'),
(6, 2, 11, 6, 'completed', '2023-07-13'),
(7, 3, 12, 6, 'completed', '2023-07-13'),
(8, 2, 12, 12, 'completed', '2023-07-14'),
(9, 3, 10, 12, 'completed', '2023-07-14'),
(10, 4, 13, 12, 'cancelled_by_driver', '2023-07-14');


-- Calculate cancellation rate for ride requests involving non-banned users

WITH NonBannedUsers AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'No'
),

NonBannedTrips AS (
    SELECT t.id, t.client_id, t.driver_id, t.status, t.request_at
    FROM Trips t
    JOIN NonBannedUsers c ON t.client_id = c.users_id
    JOIN NonBannedUsers d ON t.driver_id = d.users_id
),

DailyRequests AS (
    SELECT request_at AS DAY, COUNT(*) AS total_requests
    FROM NonBannedTrips
    GROUP BY request_at
),

DailyCancellations AS (
    SELECT request_at AS DAY, COUNT(*) AS cancelled_requests
    FROM NonBannedTrips
    WHERE status IN ('cancelled_by_driver', 'cancelled_by_client')
    GROUP BY request_at
)

SELECT 
    d.day,
    COALESCE(dc.cancelled_requests, 0) / d.total_requests::DECIMAL AS cancellation_rate
FROM 
    DailyRequests d
LEFT JOIN 
    DailyCancellations dc ON d.day = dc.day
ORDER BY 
    d.day;
