-- create db adrian flores rangel
CREATE DATABASE IF NOT EXISTS SocialMediaPlatform;
USE SocialMediaPlatform;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    profile_picture VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_text TEXT,
    post_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    media_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    like_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Follows (
    follower_id INT NOT NULL,
    following_id INT NOT NULL,
    follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (following_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_text TEXT NOT NULL,
    message_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    notification_text TEXT NOT NULL,
    notification_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Users
INSERT INTO Users (username, email, password, date_of_birth, profile_picture)
VALUES ('alice', 'alice@example.com', 'passAlice123', '1990-06-01', 'alice.jpg');
INSERT INTO Users (username, email, password, date_of_birth, profile_picture)
VALUES ('bob', 'bob@example.com', 'passBob123', '1988-11-12', 'bob.jpg');
INSERT INTO Users (username, email, password, date_of_birth, profile_picture)
VALUES ('charlie', 'charlie@example.com', 'passChar123', '1995-03-05', 'charlie.jpg');
INSERT INTO Users (username, email, password, date_of_birth, profile_picture)
VALUES ('diana', 'diana@example.com', 'passDiana123', '1992-07-17', 'diana.jpg');
INSERT INTO Users (username, email, password, date_of_birth, profile_picture)
VALUES ('edward', 'edward@example.com', 'passEd123', '1985-02-23', 'edward.jpg');

-- Posts
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (4, 'Just had a great lunch.', '2024-12-14 17:21:44', 'media1.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (2, 'Check out my blog!', '2023-07-25 13:12:55', 'media2.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (3, 'Just had a great lunch.', '2023-08-07 11:11:26', 'media3.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (5, 'Check out my blog!', '2024-04-24 16:43:36', 'media3.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (1, 'Just had a great lunch.', '2023-12-11 10:45:35', 'media2.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (2, 'Feeling great today!', '2023-01-03 14:38:47', 'media2.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (2, 'Loving this new app!', '2023-03-23 05:18:25', 'media2.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (4, 'Check out my blog!', '2024-08-12 22:45:28', 'media2.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (2, 'Check out my blog!', '2023-05-20 01:02:23', 'media3.jpg');
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (4, 'Loving this new app!', '2023-07-13 15:47:41', 'media1.jpg');

-- Comments
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (7, 1, 'Nice post!', '2023-11-29 02:26:00');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (7, 5, 'Interesting.', '2023-11-29 07:39:07');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (8, 1, 'Nice post!', '2023-03-08 23:58:03');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (9, 4, 'Interesting.', '2024-05-15 14:34:51');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (9, 2, 'Nice post!', '2024-12-22 20:39:57');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (7, 3, 'Interesting.', '2023-11-30 05:26:53');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (4, 2, 'Nice post!', '2024-08-04 10:19:43');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (4, 5, 'Interesting.', '2024-07-01 18:02:32');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (3, 5, 'Nice post!', '2024-10-22 23:09:05');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (8, 4, 'Interesting.', '2024-12-06 08:53:54');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (8, 5, 'Nice post!', '2024-04-04 12:45:43');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (8, 4, 'Interesting.', '2024-02-10 03:07:28');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (5, 2, 'Nice post!', '2023-01-01 19:32:57');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (3, 1, 'Interesting.', '2024-07-05 18:49:08');
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (1, 4, 'Nice post!', '2023-05-11 19:33:10');

-- Likes
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (8, 1, '2023-03-11 14:42:24');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (10, 3, '2024-10-25 05:31:31');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (4, 1, '2023-02-22 02:56:05');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (8, 5, '2024-06-30 23:11:24');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (10, 2, '2024-02-12 14:34:55');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (2, 2, '2024-07-14 00:36:05');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (8, 4, '2024-09-29 02:50:43');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (8, 3, '2024-01-07 00:04:07');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (2, 5, '2024-02-06 19:50:13');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (10, 4, '2024-09-21 21:57:35');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (4, 2, '2024-01-07 12:51:38');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (6, 5, '2024-09-24 01:50:24');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (2, 4, '2023-06-15 12:43:43');
INSERT INTO Likes (post_id, user_id, like_date)
VALUES (5, 4, '2024-11-01 05:35:46');

-- Follows
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (4, 3, '2023-03-07 03:31:21');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (3, 1, '2024-02-13 21:13:44');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (5, 3, '2024-06-01 20:52:56');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (5, 4, '2024-02-27 11:25:28');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (1, 2, '2024-11-21 01:22:02');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (1, 5, '2023-08-18 22:25:01');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (4, 5, '2023-10-22 23:59:32');
INSERT INTO Follows (follower_id, following_id, follow_date)
VALUES (2, 4, '2024-08-16 00:11:25');

-- Messages
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (3, 2, 'Hello!', '2024-02-11 16:55:01', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (1, 4, 'What''s up?', '2024-08-18 23:52:26', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (3, 4, 'Hello!', '2023-01-17 10:30:14', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (3, 1, 'What''s up?', '2023-02-03 16:16:38', 1);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (1, 5, 'Hello!', '2023-01-13 01:39:13', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (5, 2, 'What''s up?', '2024-06-24 17:16:01', 1);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (2, 3, 'What''s up?', '2024-05-26 07:39:32', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (2, 1, 'Hello!', '2023-11-02 06:05:48', 1);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (3, 4, 'What''s up?', '2024-10-10 09:15:49', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (5, 1, 'What''s up?', '2024-10-13 20:20:40', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (1, 2, 'Hello!', '2023-07-11 16:01:59', 0);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (5, 1, 'What''s up?', '2023-02-26 01:16:55', 1);
INSERT INTO Messages (sender_id, receiver_id, message_text, message_date, is_read)
VALUES (4, 2, 'Hello!', '2024-10-23 21:25:43', 0);

-- Notifications
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (3, 'You have a new follower.', '2023-12-09 15:54:19', 1);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (1, 'Someone liked your post.', '2023-07-04 10:02:19', 0);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (3, 'You have a new follower.', '2024-05-24 09:09:37', 1);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (2, 'Someone liked your post.', '2024-02-01 14:58:01', 1);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (1, 'You have a new follower.', '2024-01-07 21:01:19', 0);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (3, 'Someone liked your post.', '2023-08-10 15:52:30', 1);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (3, 'You have a new follower.', '2023-11-18 18:33:19', 0);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (3, 'Someone liked your post.', '2024-10-22 09:55:27', 0);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (4, 'You have a new follower.', '2023-11-05 22:26:37', 1);
INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
VALUES (2, 'Someone liked your post.', '2023-01-21 16:08:38', 0);

-- Retrieve the posts and activities of a user's timeline
SELECT 
    p.post_id,
    u.username,
    p.post_text,
    p.post_date,
    p.media_url
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
WHERE p.user_id = 1
   OR p.user_id IN (
       SELECT following_id
       FROM Follows
       WHERE follower_id = 1
   )
ORDER BY p.post_date DESC;

-- Retrieve the comments and likes for a specific post
SELECT 
    c.comment_id,
    u.username,
    c.comment_text,
    c.comment_date
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
WHERE c.post_id = 9
ORDER BY c.comment_date ASC;

SELECT 
    l.like_id,
    u.username,
    l.like_date
FROM Likes l
JOIN Users u ON l.user_id = u.user_id
WHERE l.post_id = 2;

-- Retrieve the list of followers for a user
SELECT 
    f.follower_id,
    u.username,
    f.follow_date
FROM Follows f
JOIN Users u ON f.follower_id = u.user_id
WHERE f.following_id = 1;

-- Retrieve unread messages for a user
SELECT 
    m.message_id,
    u.username AS sender,
    m.message_text,
    m.message_date
FROM Messages m
JOIN Users u ON m.sender_id = u.user_id
WHERE m.receiver_id = 1 AND m.is_read = FALSE
ORDER BY m.message_date DESC;

-- Retrieve the most liked posts
SELECT 
    p.post_id,
    u.username,
    p.post_text,
    COUNT(l.like_id) AS like_count
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, u.username, p.post_text
ORDER BY like_count DESC
LIMIT 10;

-- Retrieve the latest notifications for a user
SELECT 
    notification_id,
    notification_text,
    notification_date,
    is_read
FROM Notifications
WHERE user_id = 1
ORDER BY notification_date DESC
LIMIT 10;

-- Data modification
-- Add a New Post to the Platform
INSERT INTO Posts (user_id, post_text, post_date, media_url)
VALUES (1, 'Excited to share this new post!', NOW(), 'example.jpg');

-- Comment on a Post
INSERT INTO Comments (post_id, user_id, comment_text, comment_date)
VALUES (7, 1, 'Nice post! Thanks for sharing.', NOW());

-- Update User Profile Information
UPDATE Users
SET 
    username = 'adrian_flores',
    email = 'adrian1993@example.com',
    profile_picture = 'new_profile_pic.jpg'
WHERE user_id = 1;

-- Remove a Like from a Post
DELETE FROM Likes
WHERE post_id = 7 AND user_id = 1;

-- Complex Queries:
-- Identify Users with the Most Followers

SELECT 
    u.user_id,
    u.username,
    COUNT(f.follower_id) AS follower_count
FROM Users u
LEFT JOIN Follows f ON u.user_id = f.following_id
GROUP BY u.user_id, u.username
ORDER BY follower_count DESC
LIMIT 10;

-- Find the Most Active Users (Based on Posts, Comments, and Likes)
SELECT 
    u.user_id,
    u.username,
    COUNT(DISTINCT p.post_id) AS post_count,
    COUNT(DISTINCT c.comment_id) AS comment_count,
    COUNT(DISTINCT l.like_id) AS like_count,
    (COUNT(DISTINCT p.post_id) + COUNT(DISTINCT c.comment_id) + COUNT(DISTINCT l.like_id)) AS total_activity
FROM Users u
LEFT JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
LEFT JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.user_id, u.username
ORDER BY total_activity DESC
LIMIT 10;

-- Calculate the Average Number of Comments per Post   
SELECT 
    ROUND(COUNT(c.comment_id) / COUNT(DISTINCT p.post_id), 2) AS avg_comments_per_post
FROM Posts p
LEFT JOIN Comments c ON p.post_id = c.post_id;

-- Advanced Topics
-- Automatically Notify Users of New Messages
DELIMITER $$
CREATE TRIGGER after_new_message
AFTER INSERT ON Messages
FOR EACH ROW
BEGIN
    INSERT INTO Notifications (user_id, notification_text, notification_date, is_read)
    VALUES (
        NEW.receiver_id,
        CONCAT('You received a new message from user ID ', NEW.sender_id),
        NOW(),
        FALSE
    );
END$$
DELIMITER ;

-- Update Post Counts and Follower Counts for Users
ALTER TABLE Users
ADD COLUMN post_count INT DEFAULT 0,
ADD COLUMN follower_count INT DEFAULT 0;

-- Trigger: Update post_count after new post
DELIMITER $$
CREATE TRIGGER after_new_post
AFTER INSERT ON Posts
FOR EACH ROW
BEGIN
    UPDATE Users
    SET post_count = post_count + 1
    WHERE user_id = NEW.user_id;
END$$
DELIMITER ;

--  Trigger: Update follower_count after new follow
DELIMITER $$
CREATE TRIGGER after_new_follow
AFTER INSERT ON Follows
FOR EACH ROW
BEGIN
    UPDATE Users
    SET follower_count = follower_count + 1
    WHERE user_id = NEW.following_id;
END$$
DELIMITER ;

-- Generate Personalized Recommendations to Follow
DELIMITER $$
CREATE PROCEDURE GetFollowRecommendations(IN current_user_id INT)
BEGIN
    SELECT u.user_id, u.username, u.follower_count
    FROM Users u
    WHERE u.user_id != current_user_id
      AND u.user_id NOT IN (
          SELECT following_id
          FROM Follows
          WHERE follower_id = current_user_id
      )
    ORDER BY u.follower_count DESC
    LIMIT 5;
END$$
DELIMITER ;

CALL GetFollowRecommendations(1);  -- Replace 1 with your user_id



