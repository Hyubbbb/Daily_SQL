-- (https://school.programmers.co.kr/learn/courses/30/lessons/59413, Lv.4)

WITH RECURSIVE cte AS
(
    SELECT 0 as n
    UNION ALL
    SELECT n+1 FROM cte WHERE n<23
)
SELECT n AS HOUR, COUNT(ANIMAL_ID) AS COUNT
FROM ANIMAL_OUTS
RIGHT JOIN cte
ON HOUR(DATETIME) = n
GROUP BY 1
ORDER BY 1
