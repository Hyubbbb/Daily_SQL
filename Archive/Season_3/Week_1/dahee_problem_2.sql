-- Programmers > SELECT > 아픈 동물 찾기
-- 동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회
-- 결과는 아이디 순으로
-- https://school.programmers.co.kr/learn/courses/30/lessons/59036#fn1

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = 'Sick'
ORDER BY ANIMAL_ID;