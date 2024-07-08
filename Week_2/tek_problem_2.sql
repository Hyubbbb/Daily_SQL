-- 프로그래머스 특정 세대의 대장균 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/301650

-- 재귀 쿼리 사용 (WITH RECURSIVE)
WITH RECURSIVE cte
AS (
    -- Non-Recursive 문장 (첫 번째 루프에서만 실행됨)
    SELECT E1.ID, E1.PARENT_ID, 1 AS GEN
    FROM ECOLI_DATA AS E1
    WHERE E1.PARENT_ID IS NULL
    
    UNION ALL
    -- Recursive 문장 (읽어올 때마다 행의 위치가 기억되어 다음번에 읽어올 때 다음 행으로 이동)
    SELECT E2.ID, E2.PARENT_ID, GEN+1
    FROM ECOLI_DATA AS E2
    INNER JOIN cte
        ON cte.ID = E2.PARENT_ID
)

SELECT cte.ID
FROM cte
-- 3세대 대장균만 필터링
WHERE cte.GEN = 3
ORDER BY cte.ID