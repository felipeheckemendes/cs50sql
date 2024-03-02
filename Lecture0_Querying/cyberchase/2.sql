-- list the season number of, and title of, the first episode of every season.
SELECT "season", "title" as "first episode" FROM "episodes" WHERE "episode_in_season"=1;  