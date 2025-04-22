-- https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

SELECT
      s.user_id
    , ROUND(SUM(CASE WHEN action='confirmed' THEN 1 ELSE 0 END) / COUNT(CASE WHEN action THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    on s.user_id = c.user_id
GROUP BY s.user_id
