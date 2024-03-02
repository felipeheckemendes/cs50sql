CREATE VIEW "total" AS
    SELECT 
        SUM("families") AS "Total families",
        SUM("households") AS "Total households",
        SUM("population") AS "Total population",
        SUM("male") AS "Total male",
        SUM("female") AS "Total female"
    FROM "census"
;