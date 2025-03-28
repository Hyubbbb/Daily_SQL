/* leetcode Medium 한 번 더 풀기
1164. Product Price at a Given Date
https://leetcode.com/problems/product-price-at-a-given-date/description/ */

WITH CTE AS (
    SELECT product_id, new_price
    FROM Products
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date) as max_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    )
)

SELECT product_id, COALESCE(new_price, 10) as price
FROM (SELECT DISTINCT product_id FROM Products) as t
LEFT JOIN CTE
    USING (product_id)


-- WITH last_price AS (
--     SELECT product_id, 
--         new_price, 
--         ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS row_number 
--     FROM products 
--     WHERE change_date <='2019-08-16'
-- ) 
-- SELECT p.product_id, COALESCE(l.new_price, 10) AS price
-- FROM (
--     SELECT DISTINCT product_id FROM products
-- ) p
-- LEFT JOIN last_price l 
-- ON p.product_id = l.product_id AND l.row_number = 1