-- 대장균들의 자식의 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/299305

SELECT 
    E.ID,
    COUNT(C.ID) AS CHILD_COUNT
FROM ECOLI_DATA E
LEFT JOIN 
    ECOLI_DATA C
    ON E.ID = C.PARENT_ID
GROUP BY E.ID
ORDER BY E.ID;
