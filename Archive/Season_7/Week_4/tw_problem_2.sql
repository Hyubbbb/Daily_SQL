-- COUNT 함수 안에서도 CASE WHEN을 사용할 용기
-- 용기가 부족했다

SELECT s.user_id,
    (CASE
        WHEN ROUND((COUNT(CASE WHEN c.action = 'confirmed' THEN 1 ELSE NULL END) / COUNT(c.action)), 2) IS NULL THEN 0
        ELSE ROUND((COUNT(CASE WHEN c.action = 'confirmed' THEN 1 ELSE NULL END) / COUNT(c.action)), 2) END)
    AS "confirmation_rate"
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id 
GROUP BY s.user_id
