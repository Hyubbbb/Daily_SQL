-- GROUPING SETS
SELECT 
    region,
    product,
    SUM(amount) AS total_sales
FROM sales
GROUP BY GROUPING SETS (
    (region),           -- 지역별 합계
    (product),          -- 제품별 합계  
    ()                  -- 전체 합계
)
ORDER BY region, product;