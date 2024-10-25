-- 이름이 있는 동물의 아이디
-- https://school.programmers.co.kr/learn/courses/30/lessons/59407
SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
ORDER BY ANIMAL_ID ASC;
