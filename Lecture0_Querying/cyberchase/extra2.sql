-- Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
-- Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.

SELECT strftime('%Y', "air_date"), MIN(strftime('%m-%d', "air_date")) from "episodes" GROUP BY strftime('%Y', "air_date");