CREATE VIEW "june_vacancies" AS
    SELECT "availabilities"."id" AS "availability_id", "listing_id", "property_type", "host_name", COUNT(*)AS "days_vacant"
    FROM "availabilities"
    JOIN "listings" ON "availabilities"."listing_id"= "listings"."id"
    WHERE "available"='TRUE' AND "date">='2023-06-01' AND "date"<='2023-06-30'
    GROUP BY "listing_id"
    ORDER BY "listing_id"
;