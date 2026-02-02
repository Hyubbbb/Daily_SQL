-- https://school.programmers.co.kr/learn/courses/30/lessons/131535
SELECT COUNT(*) AS users
FROM user_info
WHERE 1=1
    AND age BETWEEN 20 AND 29
    AND joined BETWEEN '2021-01-01' AND '2021-12-31'
