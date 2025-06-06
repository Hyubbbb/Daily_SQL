-- 월별 매출 전월 대비
SELECT 
    sales_month,
    monthly_sales,
    LAG(monthly_sales, 1) OVER (ORDER BY sales_month) as prev_month_sales,
    LEAD(monthly_sales, 1) OVER (ORDER BY sales_month) as next_month_sales,
    monthly_sales - LAG(monthly_sales, 1) OVER (ORDER BY sales_month) as mom_change
FROM monthly_summary
ORDER BY sales_month;