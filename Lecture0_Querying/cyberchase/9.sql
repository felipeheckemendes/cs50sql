-- write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.
SELECT COUNT(*) as "Episodes on the first 6 years (2002 to 2007)" from "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-01-01'; 
