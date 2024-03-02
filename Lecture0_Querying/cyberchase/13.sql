-- write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR
-- > Find all topics discussed on the first or last episode of each season

SELECT "topic" FROM 
(
    SELECT "topic", MAX("episode_in_season") as "episode_in_season" from "episodes" GROUP BY "season"

    UNION

    SELECT "topic", MIN("episode_in_season") as "episode_in_season" from "episodes" GROUP BY "season"
);