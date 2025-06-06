-- 작년 같은 날짜 데이터와 비교
SELECT 
    current_date,
    current_sales,
    DATEADD('year', -1, current_date) as prev_year_date,
    prev_sales,
    (current_sales - prev_sales) as growth
FROM (
    SELECT 
        sales_date as current_date,
        SUM(sales_amount) as current_sales
    FROM sales_2025
    GROUP BY sales_date
) current
LEFT JOIN (
    SELECT 
        DATEADD('year', 1, sales_date) as future_date,
        SUM(sales_amount) as prev_sales
    FROM sales_2024
    GROUP BY sales_date
) previous ON current.current_date = previous.future_date;