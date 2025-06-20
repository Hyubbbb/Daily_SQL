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