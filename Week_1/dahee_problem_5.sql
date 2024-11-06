-- Programmers > SELECT > 여러 기준으로 정렬하기
-- 동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회
-- 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 제시
-- https://school.programmers.co.kr/learn/courses/30/lessons/59404

SELECT ANIMAL_ID, NAME, DATETIME
FROM ANIMAL_INS
ORDER BY NAME ASC, DATETIME DESC;