-- 이메일 유효성 검증
SELECT id, name, email
FROM customer_data
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';