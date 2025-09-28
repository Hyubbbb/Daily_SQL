-- Write your MySQL query statement below

WITH cnt AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT(product_key)) AS 'customer_cnt'
    FROM customer
    GROUP BY customer_id
), prd_cnt AS (
    SELECT COUNT(product_key) AS 'max_cnt'
    FROM product
)


SELECT 
    customer_id
FROM cnt CROSS JOIN prd_cnt
WHERE customer_cnt = max_cnt
