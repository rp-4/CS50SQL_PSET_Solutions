/*In 13.sql, write a SQL query to answer a question you have about the data! The query should:
Involve at least one JOIN or subquery */

SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary FROM "districts"
JOIN "expenditures"
ON districts.id = expenditures.district_id
JOIN "staff_evaluations"
ON districts.id = staff_evaluations.district_id
WHERE districts.type = "Public School District"
AND expenditures.per_pupil_expenditure > (
    SELECT MIN(expenditures.per_pupil_expenditure) FROM "expenditures")
AND staff_evaluations.exemplary > 70
ORDER BY staff_evaluations.exemplary DESC, expenditures.per_pupil_expenditure DESC
LIMIT 10;
