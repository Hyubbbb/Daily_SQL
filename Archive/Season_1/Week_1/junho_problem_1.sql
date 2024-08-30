 -- (https://school.programmers.co.kr/learn/courses/30/lessons/299305)

SELECT p.ID, COUNT(c.PARENT_ID) AS CHILD_COUNT
FROM ECOLI_DATA as p
LEFT JOIN ECOLI_DATA as c
ON p.ID = c.PARENT_ID
GROUP BY p.ID
ORDER BY p.ID;
