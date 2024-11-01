-- 대장균들의 자식의 수 구하기
SELECT 
    e1.ID, 
    COUNT(e2.ID) AS CHILD_COUNT
FROM 
    ECOLI_DATA e1
LEFT JOIN 
    ECOLI_DATA e2 
ON 
    e1.ID = e2.PARENT_ID
GROUP BY 
    e1.ID
ORDER BY 
    e1.ID ASC;
