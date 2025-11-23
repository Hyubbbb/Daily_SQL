-- https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50
SELECT 
    product_name, 
    year,
    price
FROM sales AS s
    JOIN product AS p
        ON s.product_id = p.product_id;
