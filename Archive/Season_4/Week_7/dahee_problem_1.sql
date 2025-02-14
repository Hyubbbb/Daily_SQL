-- Programmers > String, Date > 한 해에 잡은 물고기 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151138
SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO
WHERE TIME LIKE '2021%'