CREATE VIEW "available" AS
    SELECT "availabilities"."id" AS "availability_id", "listing_id" AS "id", "property_type", "host_name", "date"
    FROM "availabilities"
    JOIN "listings" ON "availabilities"."listing_id"= "listings"."id"
    WHERE "available"='TRUE'
;