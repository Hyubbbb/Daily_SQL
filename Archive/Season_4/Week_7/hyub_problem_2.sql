-- https://solvesql.com/problems/high-season-of-restaurant/

SELECT *
FROM tips
WHERE day IN 
  (SELECT
    day
  FROM tips
  GROUP BY day
    HAVING SUM(total_bill) >= 1500)
