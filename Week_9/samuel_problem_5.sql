-- https://school.programmers.co.kr/learn/courses/30/lessons/131528
-- Should I count distinct users?
SELECT
    COUNT(DISTINCT USER_ID) AS USERS

FROM USER_INFO
WHERE AGE IS NULL;