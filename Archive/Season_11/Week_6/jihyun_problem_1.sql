# --https://school.programmers.co.kr/learn/courses/30/lessons/131533

WITH sales AS (
    SELECT product_id, SUM(sales_amount) AS amount
    FROM offline_sale as off
    GROUP BY product_id
)

SELECT product_code, price * amount AS sales
FROM product 
JOIN sales
    ON product.product_id = sales.product_id
ORDER BY sales DESC, product_code

