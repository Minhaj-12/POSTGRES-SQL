-- Step 1: Create the Posts table
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    post_content TEXT,
    post_date TIMESTAMP
);

-- Step 2: Create the UserReactions table
CREATE TABLE UserReactions (
    reaction_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    reaction_type VARCHAR(20),
    reaction_date TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

-- Step 3: Insert data into the Posts table
INSERT INTO Posts (post_id, post_content, post_date)
VALUES 
(1, 'Lorem ipsum dolor sit amet', '2023-08-25 10:00:00'),
(2, 'Exploring the beauty of nature', '2023-08-26 15:30:00'),
(3, 'Unveiling the latest tech trends', '2023-08-27 12:00:00'),
(4, 'Journey into the world of literature', '2023-08-28 09:45:00'),
(5, 'Capturing the essence of city life', '2023-08-29 16:20:00');

-- Step 4: Insert data into the UserReactions table
INSERT INTO UserReactions (reaction_id, user_id, post_id, reaction_type, reaction_date)
VALUES 
(1, 101, 1, 'like', '2023-08-25 10:15:00'),
(2, 102, 1, 'comment', '2023-08-25 11:30:00'),
(3, 103, 1, 'share', '2023-08-26 12:45:00'),
(4, 101, 2, 'like', '2023-08-26 15:45:00'),
(5, 102, 2, 'comment', '2023-08-27 09:20:00'),
(6, 104, 2, 'like', '2023-08-27 10:00:00'),
(7, 105, 3, 'comment', '2023-08-27 14:30:00'),
(8, 101, 3, 'like', '2023-08-28 08:15:00'),
(9, 103, 4, 'like', '2023-08-28 10:30:00'),
(10, 105, 4, 'share', '2023-08-29 11:15:00'),
(11, 104, 5, 'like', '2023-08-29 16:30:00'),
(12, 101, 5, 'comment', '2023-08-30 09:45:00');

-- Step 5: Retrieve counts of likes, comments, and shares for a specific post
SELECT 
    p.post_id,
    p.post_content,
    COUNT(CASE WHEN r.reaction_type = 'like' THEN 1 END) AS num_likes,
    COUNT(CASE WHEN r.reaction_type = 'comment' THEN 1 END) AS num_comments,
    COUNT(CASE WHEN r.reaction_type = 'share' THEN 1 END) AS num_shares
FROM 
    Posts p
LEFT JOIN 
    UserReactions r
ON 
    p.post_id = r.post_id
WHERE 
    p.post_id = 2
GROUP BY 
    p.post_id, p.post_content;

-- Step 6: Calculate daily engagement metrics
SELECT 
    DATE(r.reaction_date) AS reaction_day,
    COUNT(DISTINCT r.user_id) AS distinct_users,
    COUNT(*) AS total_reactions,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT r.user_id), 4) AS avg_reactions_per_user
FROM 
    UserReactions r
GROUP BY 
    DATE(r.reaction_date)
ORDER BY 
    reaction_day;

-- Step 7: Identify the top 3 engaging posts within the last week
SELECT 
    post_id,
    post_content,
    COUNT(*) AS total_reactions
FROM 
    Posts
JOIN 
    UserReactions USING (post_id)
WHERE 
    reaction_date >= DATE('2023-08-23') AND reaction_date <= DATE('2023-08-30')
GROUP BY 
    post_id, post_content
ORDER BY 
    total_reactions DESC
LIMIT 3;
