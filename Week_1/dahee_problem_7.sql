-- Programmers > SELECT > 상위 n개 레코드
-- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회
-- !! ORDER BY로 정렬 후 LIMIT N 사용 !!
-- https://school.programmers.co.kr/learn/courses/30/lessons/59405

SELECT NAME
FROM ANIMAL_INS
ORDER BY DATETIME ASC
LIMIT 1;