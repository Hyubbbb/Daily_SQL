-- https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50

WITH Min_year AS(
    SELECT 
          product_id
        , MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id)
SELECT 
      s.product_id
    , first_year
    , quantity
    , price
FROM Sales s
JOIN Min_year m
    on s.product_id = m.product_id
        AND s.year = m.first_year

-- 개선사항: PARTITION BY 윈도우 함수를 쓰면, WITH 없이도 쿼리를 짤 수 있었다
