-- 프로그래머스 오랜 기간 보호한 동물 (2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/59411

SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS AS I
JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
-- 보호 기간이 가장 길었던 동물 : 입양 간 날짜와 들어온 날짜의 차이가 큰 동물
ORDER BY O.DATETIME-I.DATETIME DESC
LIMIT 2
