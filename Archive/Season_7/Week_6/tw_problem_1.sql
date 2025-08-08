-- If a product does not have any sold units, its average selling price is assumed to be 0.
-- 위 조건 충족을 위해 CASE WHEN 구분

WITH price AS (SELECT p.product_id, price*units AS 'total_price', units
FROM Prices p LEFT JOIN UnitsSold s
    ON p.product_id=s.product_id
    AND s.purchase_date BETWEEN p.start_date AND p.end_date)

SELECT product_id, 
    CASE WHEN ROUND(SUM(total_price)/SUM(units), 2) IS NULL THEN 0
    ELSE ROUND(SUM(total_price)/SUM(units), 2) END AS 'average_price'
FROM price
GROUP BY product_id
