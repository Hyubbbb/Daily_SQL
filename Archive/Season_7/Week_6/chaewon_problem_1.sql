-- 월별 매출 증감률과 동시에 전년 동월 대비 성장률 계산
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') as month,
        SUM(amount) as monthly_total
    FROM orders 
    WHERE order_date >= '2022-01-01'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    monthly_total,
    LAG(monthly_total) OVER (ORDER BY month) as prev_month,
    LAG(monthly_total, 12) OVER (ORDER BY month) as same_month_last_year,
    CASE 
        WHEN LAG(monthly_total) OVER (ORDER BY month) IS NOT NULL 
        THEN ROUND((monthly_total - LAG(monthly_total) OVER (ORDER BY month)) 
                  / LAG(monthly_total) OVER (ORDER BY month) * 100, 2)
    END as mom_growth_rate,
    CASE 
        WHEN LAG(monthly_total, 12) OVER (ORDER BY month) IS NOT NULL 
        THEN ROUND((monthly_total - LAG(monthly_total, 12) OVER (ORDER BY month)) 
                  / LAG(monthly_total, 12) OVER (ORDER BY month) * 100, 2)
    END as yoy_growth_rate
FROM monthly_sales
ORDER BY month;