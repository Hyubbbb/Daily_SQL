-- https://solvesql.com/problems/restaurant-vip/
WITH day_vip AS (
    SELECT
        day,
        MAX(total_bill) AS max_bill
    FROM tips
    GROUP BY day
)
SELECT tips.*
FROM tips
  JOIN day_vip AS vip
      ON tips.total_bill = vip.max_bill
      AND tips.day = vip.day
