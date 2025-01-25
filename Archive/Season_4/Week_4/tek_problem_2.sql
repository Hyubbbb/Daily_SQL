/* 	1164. Product Price at a Given Date
https://leetcode.com/problems/product-price-at-a-given-date/description/ */

WITH CTE AS (
    SELECT product_id, MAX(change_date) as max_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT t2.product_id, max(price) as price
FROM (
    SELECT p.product_id, max_date, 
        CASE
            WHEN p.product_id NOT IN (SELECT product_id FROM products WHERE change_date <= '2019-08-16') THEN 10
            WHEN c.max_date IS NULL THEN NULL
            ELSE new_price
        END as price
    FROM products as p
    LEFT JOIN CTE as c
        ON c.product_id = p.product_id AND c.max_date = p.change_date
) as t2
WHERE t2.price IS NOT NULL
GROUP BY t2.product_id