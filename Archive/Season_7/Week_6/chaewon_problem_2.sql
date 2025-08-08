SELECT c.customer_id, c.name, c.email
FROM customers c
WHERE EXISTS (
    -- 최근 3개월간 구매 이력 있음
    SELECT 1 FROM orders o 
    WHERE o.customer_id = c.customer_id 
    AND o.order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
)
AND NOT EXISTS (
    -- 지난달엔 구매 안함
    SELECT 1 FROM orders o2 
    WHERE o2.customer_id = c.customer_id 
    AND o2.order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND o2.order_date < CURDATE()
)
AND c.status = 'ACTIVE';