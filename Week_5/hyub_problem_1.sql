-- # 3세대의 대장균의 ID 출력
--     # 대장균의 ID 에 대해 오름차순 정렬

WITH RECURSIVE cte AS (
    -- Anchor member: 최초 대장균
    SELECT ID, PARENT_ID, 1 AS GEN
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    
    UNION ALL 
    
    -- Recursive member: 재귀적으로 호출될 쿼리
    SELECT b.ID, b.PARENT_ID, cte.GEN + 1
    FROM ECOLI_DATA b
    JOIN cte ON b.PARENT_ID = cte.ID
)

SELECT ID
FROM cte
WHERE GEN = 3
ORDER BY ID
