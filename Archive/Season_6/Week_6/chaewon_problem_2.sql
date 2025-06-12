SELECT 
    customer_id,
    COUNT(*) as total_orders,
    COUNT(CASE WHEN status = 'y' THEN 1 END) as completed_orders,
    ROUND(COUNT(CASE WHEN status = 'y' THEN 1 END) * 100.0 / COUNT(*), 2) as completion_rate
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 5  -- 최소 5건 이상 주문한 고객만
   AND COUNT(CASE WHEN status = 'y' THEN 1 END) * 100.0 / COUNT(*) >= 80
ORDER BY completion_rate DESC, total_orders DESC;