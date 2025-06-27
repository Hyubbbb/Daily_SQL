-- 3개월 이상 잠들어 있는 휴면계좌 조회
SELECT a.account_id,
       a.customer_id,
       a.account_type,
       a.balance,
       a.open_date
FROM accounts a
WHERE a.status = 'ACTIVE'
  AND NOT EXISTS (
    SELECT 1
    FROM transactions t
    WHERE t.account_id = a.account_id
      AND t.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
  )
ORDER BY a.balance DESC;