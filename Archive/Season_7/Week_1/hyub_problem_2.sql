-- https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50
WITH TMP AS (
    SELECT 
        product_id,
        MAX(change_date) AS max_cd
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
SELECT DISTINCT
    -- *
    p1.product_id,
    CASE
    WHEN max_cd IS NOT NULL THEN new_price 
    WHEN max_cd IS NULL THEN 10
    END AS price 
FROM Products AS p1
LEFT JOIN TMP AS tmp
    ON p1.product_id = tmp.product_id
WHERE p1.change_date = tmp.max_cd
    OR tmp.max_cd IS NULL
-- ORDER BY p1.product_id
