-- GROUPING SETS
SELECT c.city, a.account_type, SUM(a.balance) AS total
FROM accounts a 
JOIN customers c ON a.customer_id = c.customer_id
GROUP BY GROUPING SETS (
    (),                        -- 전체 합계
    (c.city),                  -- 도시별 합계
    (a.account_type),          -- 계좌유형별 합계
    (c.city, a.account_type)   -- 도시+계좌유형별 합계
);