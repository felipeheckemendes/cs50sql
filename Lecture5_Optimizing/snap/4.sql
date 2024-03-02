EXPLAIN QUERY PLAN
SELECT "username"
FROM "users"
WHERE "id" = (
    SELECT "to_user_id" FROM (
        SELECT "to_user_id", COUNT(*) AS "number_of_messages"
        FROM "messages"
        GROUP BY "to_user_id"
        ORDER BY "number_of_messages" DESC
        LIMIT 1
    )
);