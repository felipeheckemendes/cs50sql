-- 12.sql
-- A parent asks you for advice on finding the best public school districts in Massachusetts. 
-- In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”. 
-- Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary.
-- Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).
-- 
-- Hint
-- You might find it helpful to know that subqueries can be inserted into most any part of a SQL query, including conditions. For instance, the following is valid SQL syntax:

-- SELECT "column" FROM "table"
-- WHERE "column" > (
--     SELECT AVG("column")
--     FROM "table"
-- );

SELECT "name", "per_pupil_expenditure", "exemplary"
FROM "districts"
LEFT JOIN "expenditures" ON "districts"."id"="expenditures"."district_id"
LEFT JOIN "staff_evaluations" ON "districts"."id"="staff_evaluations"."district_id"
WHERE 
    "per_pupil_expenditure"> (
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
    and
    "exemplary" > (
        SELECT AVG("exemplary") FROM "staff_evaluations"
    )
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC
;