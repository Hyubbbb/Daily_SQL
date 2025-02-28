-- Programmers > GROUP BY > 동명 동물 수 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/59041#qna
SELECT NAME, COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING COUNT > 1
ORDER BY NAME ASC;