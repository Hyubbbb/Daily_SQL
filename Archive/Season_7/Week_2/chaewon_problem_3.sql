-- 한 번의 테이블 스캔으로 모든 집계 완료
-- union all 방식 -> grouping sets 방식으로
SELECT 
    CASE 
        WHEN GROUPING(c.city) = 1 AND GROUPING(a.account_type) = 1 THEN 'TOTAL'
        WHEN GROUPING(a.account_type) = 1 THEN 'BY_CITY'
        WHEN GROUPING(c.city) = 1 THEN 'BY_TYPE'
        ELSE 'BY_CITY_TYPE'
    END AS analysis_level,
    c.city,
    a.account_type,
    SUM(a.balance) AS total_balance,
    COUNT(*) AS account_count
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
WHERE a.status = 'ACTIVE'
GROUP BY GROUPING SETS (
    (),                        
    (c.city),                    
    (a.account_type),            
    (c.city, a.account_type)     
)
ORDER BY 
    GROUPING(c.city), 
    GROUPING(a.account_type), 
    c.city, 
    a.account_type;