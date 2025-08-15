-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/?envType=study-plan-v2&envId=top-sql-50
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders AS o
JOIN Products AS p
    ON o.product_id = p.product_id
WHERE 1=1
    AND order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY o.product_id, p.product_name
    HAVING SUM(unit) >= 100
