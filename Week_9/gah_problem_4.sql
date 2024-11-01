-- [PROGRAMMERS] SELECT > 대장균들의 자식의 수 구하기

SELECT p.ID, COUNT(c.PARENT_ID) CHILD_COUNT -- COUNT(컬럼명): NULL 제외하고 카운트 -> 없으면 0
FROM ECOLI_DATA p LEFT JOIN ECOLI_DATA c
     ON p.ID = c.PARENT_ID
GROUP BY p.ID
ORDER BY 1