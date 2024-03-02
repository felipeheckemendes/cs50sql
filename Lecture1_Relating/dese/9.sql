-- 9.sql
-- Another parent wants to send their child to a district with few other students. 
-- In 9.sql, write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).
-- 

SELECT "name"
FROM "districts"
LEFT JOIN "expenditures" ON "districts"."id"="expenditures"."district_id"
WHERE "pupils" = (
    SELECT MIN("pupils") FROM "expenditures" LIMIT 30
);
