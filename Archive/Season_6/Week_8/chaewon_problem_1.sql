-- 잔액이 가장 많은 계좌 조회
SELECT c.customer_id,
       c.name,
       a.account_id,
       a.account_type,
       a.balance
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.status = 'ACTIVE'
  AND a.balance = (
    SELECT MAX(a2.balance)
    FROM accounts a2
    WHERE a2.customer_id = c.customer_id
      AND a2.status = 'ACTIVE'
  )
ORDER BY a.balance DESC;