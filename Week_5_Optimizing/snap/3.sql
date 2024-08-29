/*The app needs to rank a user’s “best friends,” similar to Snapchat’s “Friend Emojis” feature.
Find the user IDs of the top 3 users to whom creativewisdom377 sends messages most frequently.
Order the user IDs by the number of messages creativewisdom377 has sent to those users, most to least.  */


SELECT messages.to_user_id FROM "users"
JOIN friends
ON friends.user_id = users.id
JOIN messages
ON messages.from_user_id = users.id
WHERE users.username = 'creativewisdom377'
GROUP BY messages.to_user_id ORDER BY COUNT(messages.to_user_id) DESC LIMIT 3;
