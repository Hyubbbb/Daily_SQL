-- https://solvesql.com/problems/daily-revenue/

SELECT
  day,
  SUM(total_bill) AS revenue_daily
FROM
  tips
GROUP BY
  day
HAVING
  SUM(total_bill) >= 1000
ORDER BY
  revenue_daily DESC;
