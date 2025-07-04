-- 평균 잔액보다 높은 잔액을 가진 계좌들의 정보 조회
SELECT account_id, customer_id, balance
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
    WHERE status = 'ACTIVE'
)
ORDER BY balance DESC;