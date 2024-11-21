-- https://solvesql.com/problems/characteristics-of-orders/

-- country는 미국 뿐
-- order_id가 중복이 있었다. 단, category는 다르기도 했다 이자식들

WITH TMP AS
  (SELECT DISTINCT order_id, region, category
  FROM records)

SELECT region AS Region, 
  COUNT(CASE WHEN category = 'Furniture' THEN order_id ELSE NULL END) AS Furniture,
  COUNT(CASE WHEN category = 'Office Supplies' THEN order_id ELSE NULL END) AS 'Office Supplies',
  COUNT(CASE WHEN category = 'Technology' THEN order_id ELSE NULL END) AS Technology
FROM TMP
GROUP BY region
ORDER BY region
