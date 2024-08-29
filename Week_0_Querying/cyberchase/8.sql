-- write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.
SELECT COUNT(title) FROM "episodes" WHERE air_date LIKE '2018%' OR air_date LIKE '2019%' OR air_date LIKE '2020%' OR air_date LIKE '2021%' OR air_date LIKE '2022%' OR air_date LIKE '2023%';
