-- 각 고객별로 총 계좌 수, 총 잔액, 평균 잔액을 조회하고, 총 잔액이 1000만원 이상인 고객
SELECT c.customer_id,
       c.name,
       COUNT(a.account_id) AS total_accounts,
       SUM(a.balance) AS total_balance,
       AVG(a.balance) AS avg_balance
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id 
                     AND a.status = 'ACTIVE'
GROUP BY c.customer_id, c.name
HAVING SUM(a.balance) >= 10000000
ORDER BY total_balance DESC;