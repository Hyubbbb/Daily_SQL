-- 계좌 2개 이상, 500만원 이상 조회
SELECT c.customer_id,
       c.name,
       COUNT(a.account_id) AS account_count,
       AVG(a.balance) AS avg_balance,
       SUM(a.balance) AS total_balance
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id 
                      AND a.status = 'ACTIVE'
GROUP BY c.customer_id, c.name
HAVING COUNT(a.account_id) >= 2
   AND AVG(a.balance) >= 5000000
ORDER BY avg_balance DESC;