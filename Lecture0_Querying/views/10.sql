-- write a SQL query to answer a question of your choice about the prints. The query should:
-- Make use of AS to rename a column
-- Involve at least one condition, using WHERE
-- Sort by at least one column, using ORDER BY

-- Show the average entropy of each artist's views containing "Fuji" on the name, ordering by the average entropy from highest to lowest.
SELECT "artist", ROUND(AVG("entropy"), 2) AS "Average entropy of views with Fuji on title" FROM "views" WHERE "english_title" LIKE '%Fuji%' GROUP BY "artist" ORDER BY AVG("entropy") DESC;