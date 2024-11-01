-- https://school.programmers.co.kr/learn/courses/30/lessons/293259
-- Easy

SELECT
    ROUND(AVG(COALESCE(LENGTH, 10)), 2) AS AVERAGE_LENGTH

FROM FISH_INFO;