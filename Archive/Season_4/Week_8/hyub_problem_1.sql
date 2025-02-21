-- https://solvesql.com/problems/restaurant-vip/

SELECT
  a.total_bill,
  a.tip,
  a.sex,
  a.smoker,
  a.day,
  a.time,
  a.size
FROM tips AS a
JOIN 
  (SELECT
    day,
    MAX(total_bill) AS max_bill
  FROM tips
  GROUP BY day) AS b on a.day = b.day
WHERE total_bill = max_bill
