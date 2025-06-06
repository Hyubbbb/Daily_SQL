-- 특정 세대의 대장균 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/301650

SELECT third_gen.ID
FROM ECOLI_DATA AS first_gen
JOIN ECOLI_DATA AS second_gen ON second_gen.PARENT_ID = first_gen.ID
JOIN ECOLI_DATA AS third_gen ON third_gen.PARENT_ID = second_gen.ID
WHERE first_gen.PARENT_ID IS NULL
ORDER BY third_gen.ID ASC;
