/*write SQL query to answer a question of your choice. This query should:
Make use of AS to rename a column
Involve at least condition, using WHERE
Sort by at least one column using ORDER BY */

SELECT first_name AS "First Name", last_name AS "Last Name" FROM "players" WHERE birth_year = 1992 AND birth_month = 8 AND birth_day = 4
AND bats = "L" OR throws = "L" ORDER BY first_name, last_name;
