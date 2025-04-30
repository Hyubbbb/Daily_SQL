-- https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50
-- 1. NULL case 처리가 필요했다

SELECT
      p.product_id
    , COALESCE(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices p 
LEFT JOIN UnitsSold u
    on (u.purchase_date BETWEEN p.start_date AND p.end_date)
     AND p.product_id = u.product_id
GROUP BY p.product_id
