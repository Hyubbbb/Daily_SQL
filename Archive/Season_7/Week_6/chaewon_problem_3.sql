SELECT 
    'customers' as table_name,
    COUNT(*) as total_rows,
    COUNT(email) as email_filled,
    COUNT(*) - COUNT(email) as email_null,
    SUM(CASE WHEN email = '' OR email LIKE '%@%@%' THEN 1 ELSE 0 END) as email_invalid,
    ROUND(COUNT(phone) / COUNT(*) * 100, 2) as phone_completion_rate,
    SUM(CASE 
        WHEN age < 0 OR age > 120 THEN 1 
        ELSE 0 
    END) as invalid_age_count,
    ROUND(
        (COUNT(email) + COUNT(phone) + COUNT(address)) 
        / (COUNT(*) * 3) * 100, 2
    ) as overall_completion_rate
FROM customers

UNION ALL

SELECT 
    'orders',
    COUNT(*),
    COUNT(customer_id),
    COUNT(*) - COUNT(customer_id),
    SUM(CASE WHEN amount <= 0 THEN 1 ELSE 0 END),
    ROUND(COUNT(discount) / COUNT(*) * 100, 2),
    SUM(CASE WHEN order_date > CURDATE() THEN 1 ELSE 0 END),
    ROUND((COUNT(customer_id) + COUNT(amount)) / (COUNT(*) * 2) * 100, 2)
FROM orders;