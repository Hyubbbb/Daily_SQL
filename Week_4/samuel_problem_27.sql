-- https://school.programmers.co.kr/learn/courses/30/lessons/299305
-- GROUP BY, ORDER BY, Use two identical tables to count child-parent relations

SELECT E.ID, COUNT(CASE WHEN E.ID = EC.PARENT_ID THEN 1 END) AS CHILD_COUNT
FROM ECOLI_DATA E
LEFT JOIN ECOLI_DATA EC ON E.ID = EC.PARENT_ID
GROUP BY E.ID
ORDER BY E.ID ASC;