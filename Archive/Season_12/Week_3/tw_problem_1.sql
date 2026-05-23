-- https://solvesql.com/problems/restaurant-vip/
WITH top_bill AS (
  SELECT
    day,
    MAX(total_bill) AS day_max_bill
  FROM tips
  GROUP BY day
)

SELECT
  base.*
FROM tips AS base
  JOIN top_bill AS top
    ON base.day = top.day
    AND base.total_bill = top.day_max_bill
