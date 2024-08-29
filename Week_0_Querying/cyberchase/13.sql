-- write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR
SELECT id, title, topic FROM "episodes" WHERE season = 4 AND topic LIKE '%time%' or topic LIKE '%math%';
