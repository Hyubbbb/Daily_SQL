/* leetcode Medium 한 번 더 풀기
1934. Confirmation Rate
https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT s.user_id, 
    ROUND(SUM(CASE WHEN c.action='confirmed' THEN 1 ELSE 0 END) / COUNT(s.user_id)::DECIMAL, 2) as confirmation_rate
FROM Signups as s
LEFT JOIN Confirmations as c
    USING (user_id)
GROUP BY s.user_id

/* 다른 풀이
SELECT 
    s.user_id,
    ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM Signups s
    LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id */