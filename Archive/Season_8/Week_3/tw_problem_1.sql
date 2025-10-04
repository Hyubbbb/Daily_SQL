-- Write your MySQL query statement below
-- 순위 관련해서 CTE 많이 사용

WITH base AS (
    SELECT
        product_id,
        new_price,
        RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS 'rnk'
    FROM products
    WHERE change_date < '2019-08-17'
), change_tbl AS (
    SELECT
        product_id,
        new_price AS 'price'
    FROM base
    WHERE rnk = 1
    GROUP BY product_id
), tbl AS (
    SELECT 
        product_id,
        10 AS 'price'
    FROM products
    GROUP BY product_id
    HAVING MIN(change_date) > '2019-08-16'
)

SELECT *
FROM change_tbl
  
UNION ALL

SELECT *
FROM tbl;
