-- write SQL query to answer a question of your choice. This query should:
-- Make use of AS to rename a column
-- Involve at least condition, using WHERE
-- Sort by at least one column using ORDER BY

-- Question: Find the average weight of players born on each year, but only from players born in PA, and order by birth year from most recent to most ancient

-- AS -> Average Weight
-- WHERE -> Was Born in PA
-- GROUP BY -> Birth Year
-- ORDER BY -> Birth Year

SELECT "birth_year" AS "Year", ROUND(AVG(COALESCE("weight", 0)), 2) AS "Average Weight"
FROM "players"
WHERE "birth_state" = 'PA'
GROUP BY "birth_year"
ORDER BY "birth_year" DESC;