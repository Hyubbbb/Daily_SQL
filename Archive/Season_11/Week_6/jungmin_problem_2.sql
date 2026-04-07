-- https://solvesql.com/problems/restaurant-business-day/
SELECT day AS day_of_week
FROM tips
GROUP BY day
