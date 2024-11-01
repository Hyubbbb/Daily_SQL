-- https://school.programmers.co.kr/learn/courses/30/lessons/293260
-- Easy

SELECT
    COUNT(ID) AS FISH_COUNT,
    MONTH(TIME) AS MONTH
FROM FISH_INFO
GROUP BY MONTH(TIME)
ORDER BY MONTH(TIME) ASC;