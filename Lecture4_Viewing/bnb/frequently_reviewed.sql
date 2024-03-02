CREATE VIEW "frequently_reviewed" AS
    SELECT "listing_id", "property_type", "host_name", "no_of_reviews" FROM 
    (
        SELECT "listing_id", COUNT(*) AS "no_of_reviews"
        FROM "reviews"
        GROUP BY "listing_id"
        ORDER BY "no_of_reviews" DESC
        LIMIT 100
    ) AS "100_reviews"
    JOIN "listings" ON "100_reviews"."listing_id"="listings"."id"
    ORDER BY "no_of_reviews" DESC, "property_type", "host_name"
;

/*This version below also works, but is less efficient. That's I chose the one above. Even though it is not so readable, it is faster, since the join is done only on the filtered table with the 100 most reviewed properties. No need to join all the table before filtering.

CREATE VIEW "available" AS
    SELECT "listings"."id" AS "listing_id", "property_type", "host_name", COUNT(*) AS "reviews"
    FROM "reviews"
    JOIN "listings" ON "reviews"."listing_id"= "listings"."id"
    GROUP BY "listings"."id"
    ORDER BY "reviews" DESC, "property_type", "host_name" 
    LIMIT 100
;