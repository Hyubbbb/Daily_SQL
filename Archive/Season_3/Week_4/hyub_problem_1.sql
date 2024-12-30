-- https://solvesql.com/problems/day-of-furniture/

WITH A AS(
  SELECT DISTINCT order_date, order_id
  FROM records)

SELECT order_date,
  COUNT(DISTINCT CASE WHEN category = 'Furniture' THEN order_id END) AS furniture,
  ROUND(100 * 
  ((COUNT(DISTINCT CASE WHEN category = 'Furniture' THEN order_id END)+0.00)
  /(COUNT(DISTINCT order_id)+0.00)), 2) AS furniture_pct
FROM records
WHERE order_date in (SELECT order_date
  FROM A
  GROUP BY order_date
    HAVING COUNT(order_id) >= 10)
GROUP BY order_date
  HAVING COUNT(distinct order_id) >= 10 
    AND furniture_pct >= 40
ORDER BY furniture_pct DESC, order_date
