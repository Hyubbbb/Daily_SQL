-- 여러 연락처 중 우선순위대로 선택
SELECT 
    customer_name,
    COALESCE(mobile, home_phone, work_phone, '연락처없음') as contact,
    COALESCE(discount_rate, 0) * price as final_price
FROM customers;