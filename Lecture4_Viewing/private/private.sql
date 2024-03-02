CREATE VIEW "message" AS SELECT * FROM
    (
    SELECT '1' AS "order", substr("sentence", 98, 4) AS "sentence" FROM "sentences" WHERE "id"=14
    UNION
    SELECT '2' AS "order", substr("sentence", 3, 5) AS "sentence" FROM "sentences" WHERE "id"=114
    UNION
    SELECT '3' AS "order", substr("sentence", 72, 9) AS "sentence" FROM "sentences" WHERE "id"=618
    UNION
    SELECT '4' AS "order", substr("sentence", 7, 3) AS "sentence" FROM "sentences" WHERE "id"=630
    UNION
    SELECT '5' AS "order", substr("sentence", 12, 5) AS "sentence" FROM "sentences" WHERE "id"=932
    UNION
    SELECT '6' AS "order", substr("sentence", 50, 7) AS "sentence" FROM "sentences" WHERE "id"=2230
    UNION
    SELECT '7' AS "order", substr("sentence", 44, 10) AS "sentence" FROM "sentences" WHERE "id"=2346
    UNION
    SELECT '8' AS "order", substr("sentence", 14, 5) AS "sentence" FROM "sentences" WHERE "id"=3041
    )
    ORDER BY "order"
    ;
