EXPLAIN QUERY PLAN
SELECT "to_user_id", COUNT(*) AS "number_of_messages"
FROM "messages"
WHERE "from_user_id"= (
    SELECT "id"
    FROM "users"
    WHERE "username"='creativewisdom377'
)
GROUP BY "to_user_id"
ORDER BY "number_of_messages"
LIMIT 3;