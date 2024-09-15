-- https://school.programmers.co.kr/learn/courses/30/lessons/59037
-- Easy

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged'
ORDER BY ANIMAL_ID ASC;