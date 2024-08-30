-- (https://school.programmers.co.kr/learn/courses/30/lessons/59041, Lv.2)

SELECT NAME, COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME is not NULL
GROUP BY NAME
HAVING COUNT(*) >= 2
ORDER BY NAME;
