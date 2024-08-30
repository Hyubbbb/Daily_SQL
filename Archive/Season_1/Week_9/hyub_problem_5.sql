-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

-- 내 풀이
WITH RECURSIVE cte AS (
    -- Anchor member:
    SELECT N, P, 1 AS GEN
    FROM BST
    WHERE P IS NULL
    
    UNION ALL 
    
    -- Recursive member: 
    SELECT b.N, b.P, cte.GEN + 1
    FROM BST b
    JOIN cte ON b.P = cte.N
)

SELECT N,
    CASE 
    WHEN GEN = 1 THEN 'Root'
    WHEN GEN = MAX(GEN) OVER () THEN 'Leaf'
    ELSE 'Inner'
    END AS GEN_NAME
    
FROM cte
ORDER BY N


-- GPT에게 최적화 요청 
  -- GPT: WITH RECURSIVE 필요 없다 !
  -- Hyub: 수긍
SELECT N,
    CASE 
        WHEN P IS NULL THEN 'Root'  -- 부모가 없는 경우 루트 노드
        WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'  -- 자식이 없는 경우 리프 노드
        ELSE 'Inner'  -- 그 외는 내부 노드
    END AS GEN_NAME
FROM BST
ORDER BY N;
