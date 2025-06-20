SELECT t.account_id,
       COUNT(*) AS transaction_count,
       SUM(CASE WHEN transaction_type = 'DEPOSIT' THEN amount ELSE 0 END) AS total_deposits,
       SUM(CASE WHEN transaction_type = 'WITHDRAW' THEN amount ELSE 0 END) AS total_withdrawals
FROM transactions t
WHERE t.transaction_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY t.account_id
ORDER BY transaction_count DESC;