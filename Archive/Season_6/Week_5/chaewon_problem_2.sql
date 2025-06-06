-- 주 단위로 데이터 그룹화
SELECT 
    DATE_TRUNC('week', order_date)::DATE as week_start,
    COUNT(*) as weekly_orders,
    SUM(order_amount) as weekly_revenue
FROM orders
WHERE order_date >= '2024-01-01'
GROUP BY DATE_TRUNC('week', order_date)::DATE
ORDER BY week_start;