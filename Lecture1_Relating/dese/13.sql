-- 13.sql
-- In 13.sql, write a SQL query to answer a question you have about the data! The query should:
-- 
-- Involve at least one JOIN or subquery

-- A administrator wants to work on improving the worst staff. Return to him the 20 districts with highest number of unsatisfactory evaluated staff 

SELECT * from "districts" LIMIT 15;
SELECT * from "schools" LIMIT 15;
SELECT * from "graduation_rates" LIMIT 15;
SELECT * from "expenditures" LIMIT 15;
SELECT * from "staff_evaluations" LIMIT 15;

SELECT "name", "unsatisfactory"
FROM "districts"
LEFT JOIN "staff_evaluations" ON "districts"."id"="staff_evaluations"."district_id"
ORDER BY "unsatisfactory" DESC
LIMIT 20;