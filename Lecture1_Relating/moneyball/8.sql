-- 8.sql
-- How much would the A’s need to pay to get the best home run hitter this past season? 
-- In 8.sql, write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.

-- Your query should return a table with one column, the salary of the player.

-- I have designed two options as below. I prefer the first one, so I have commented out the second.

SELECT "salary"
FROM "salaries"
JOIN "performances" ON "salaries"."player_id"="performances"."player_id"
WHERE "salaries"."year"=2001 AND "HR" = (
    SELECT MAX("HR") FROM "performances" WHERE "year"=2001
);

-- SELECT "salary"
-- FROM "salaries"
-- WHERE 
--     "year"=2001 
--     AND
--     "player_id" = (
--         SELECT "player_id" FROM "performances" WHERE "HR" = (
--             SELECT MAX("HR") FROM "performances" WHERE "year"=2001
--         )
--     );