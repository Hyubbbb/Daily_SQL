-- 일별 누적 매출액 집계
SELECT 
    sales_person, sale_date, amount AS daily_sales,
    SUM(amount) OVER (
        PARTITION BY sales_person 
        ORDER BY sale_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM sales
ORDER BY sales_person, sale_date;