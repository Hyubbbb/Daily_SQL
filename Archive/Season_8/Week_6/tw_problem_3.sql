SELECT 
    p.product_name,
    SUM(unit) AS unit
FROM Products p
    RIGHT JOIN Orders o
        ON p.product_id = o.product_id
WHERE 1=1
    AND YEAR(o.order_date) = 2020
    AND MONTH(o.order_date) = 2
GROUP BY p.product_name
HAVING SUM(unit) >= 100
