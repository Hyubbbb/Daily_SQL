-- https://school.programmers.co.kr/learn/courses/30/lessons/59041
-- NAME IS NOT NULL required

SELECT
    NAME,
    COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING COUNT(*) >= 2
ORDER BY NAME ASC;