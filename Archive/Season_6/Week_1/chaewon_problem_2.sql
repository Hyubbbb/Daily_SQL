-- https://school.programmers.co.kr/learn/courses/30/lessons/59408
-- COUNT와 DISTINCT를 함께 사용
SELECT COUNT(DISTINCT NAME) AS count
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;