-- https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50

SELECT 
      LEFT(trans_date, 7) AS month
    , country
    , COUNT(*) AS trans_count
    , SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count
    , SUM(amount) AS trans_total_amount
    , SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY LEFT(trans_date, 7), country

-- 개선 사항
    -- 1. CASE WHEN을 SUM(state = 'approved') AS approved_count으로 대체할 수 있었을 것
    -- 2. 월 추출을 위해, LEFT보다 DATE_FORMAT(trans_date, '%Y-%m')을 쓸 수 있었을 것
    -- 3. SELECT에서 지정한 alias를 GROUP BY에서 쓸 수 있었을 것
