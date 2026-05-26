WITH RECURSIVE
-- 테이블 1: generation 계산을 위한 재귀 테이블
ecoli_gen AS (
    SELECT
        id,
        parent_id,
        1 AS generation
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NULL -- (1) 1세대 부모로 시작
    
    UNION ALL
    
    SELECT
        child.id AS id,
        child.parent_id AS parent_id,
        parent.generation + 1 AS generation -- (2) 자식에게 부모의 generation + 1을 부여
    FROM ecoli_gen AS parent
        JOIN ecoli_data AS child
            ON child.parent_id = parent.id
),
-- 테이블 2: 자식이 하나라도 있는 부모의 id 리스트
has_child_list AS (
    SELECT DISTINCT
        parent_id AS id
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NOT NULL
)
SELECT
    COUNT(*) AS count,
    generation
FROM ecoli_gen AS gen
WHERE 1=1
    AND id NOT IN (SELECT id FROM has_child_list) -- 자식이 없는 대장균만 필터링
GROUP BY generation
ORDER BY generation