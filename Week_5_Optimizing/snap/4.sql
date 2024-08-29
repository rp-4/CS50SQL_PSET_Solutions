/*The app needs to send users a summary of their engagement.
Find the username of the most popular user, defined as the user who has had the most messages sent to them. */

SELECT users.username FROM users
JOIN messages
ON messages.to_user_id = users.id
GROUP BY messages.to_user_id ORDER BY COUNT(messages.to_user_id) DESC LIMIT 1;
