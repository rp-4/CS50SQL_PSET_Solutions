/*For any two users, the app needs to quickly show a list of the friends they have in common.
Given two usernames, lovelytrust487 and exceptionalinspiration482, find the user IDs of their mutual friends.
A mutual friend is a user that both lovelytrust487 and exceptionalinspiration482 count among their friends. */


SELECT friends.friend_id FROM users
JOIN friends
ON friends.user_id = users.id
WHERE users.username = 'lovelytrust487'
INTERSECT
SELECT friends.friend_id FROM users
JOIN friends
ON friends.user_id = users.id
WHERE users.username = 'exceptionalinspiration482';
