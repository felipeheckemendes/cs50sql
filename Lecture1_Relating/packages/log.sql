--Inspect the tables
SELECT * FROM "addresses" LIMIT 10;
SELECT * FROM "packages" LIMIT 10;
SELECT * FROM "scans" LIMIT 10;

-- *** The Lost Letter ***
    -- Find the ID of from_adrress
    SELECT "id" FROM "addresses" WHERE "address"='900 Somerville Avenue';
    -- Find the ID of to_address
    SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%';
    -- Find the ID of the package
    SELECT "id" FROM "packages" 
    WHERE 
        "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address"='900 Somerville Avenue')
        AND
        "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%');
    -- Find the latest scan for the package id, and Join with address
    SELECT "address_id", "action", MAX("timestamp") AS "Latest Timestamp", "address", "type" FROM 
        (
        SELECT "address_id", "action", "timestamp", "address", "type" FROM "scans"
        JOIN "addresses" ON "scans"."address_id"="addresses"."id"
        WHERE
            "package_id" = 
            (
                SELECT "id" FROM "packages" 
                WHERE 
                "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address"='900 Somerville Avenue')
                AND
                "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%')
            )
        )
    ;
        



-- *** The Devious Delivery ***
    -- Find the package id and contents
    SELECT "id", "contents" FROM "packages" 
    WHERE 
        "from_address_id" IS NULL
    ;
    -- Find the latest scan for the package id, and Join with address
    SELECT "address_id", "action", MAX("timestamp") AS "Latest Timestamp", "address", "type" FROM 
        (
        SELECT "address_id", "action", "timestamp", "address", "type" FROM "scans"
        JOIN "addresses" ON "scans"."address_id"="addresses"."id"
        WHERE
            "package_id" = 
            (
                SELECT "id" FROM "packages" 
                WHERE 
                    "from_address_id" IS NULL
            )
        )
    ;

-- *** The Forgotten Gift ***
    -- Find the ID of from_adrress
    SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street';
    -- Find the ID of to_address
    SELECT "id" FROM "addresses" WHERE "address"='728 Maple Place';
    -- Find the ID of the package
    SELECT "id", "contents" FROM "packages" 
    WHERE 
        "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street')
        AND
        "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address"='728 Maple Place');
    -- Find the latest scan for the package id, and Join with address and drivers
    SELECT "address_id", "action", "name", MAX("timestamp") AS "Latest Timestamp", "type" FROM 
        (
        SELECT * FROM "scans"
        JOIN "addresses" ON "scans"."address_id"="addresses"."id"
        JOIN "drivers" ON "scans"."driver_id"="drivers"."id"
        WHERE
            "package_id" = 
            (
                SELECT "id" FROM "packages" 
                    WHERE 
                        "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street')
                        AND
                        "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address"='728 Maple Place')
            )
        )
    ;
