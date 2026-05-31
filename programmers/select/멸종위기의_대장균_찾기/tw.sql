-- WITH RECURSIVE: CTE 안에서 자기 자신을 참조 가능함

WITH RECURSIVE gen_info AS (
    SELECT
        ecoli.id AS id,
        ecoli.parent_id AS parent_id,
        1 AS generation
    FROM ecoli_data AS ecoli
    WHERE 1=1
        AND ecoli.parent_id IS NULL

    UNION ALL
  
-- 그 다음 세대부터는 +1
  
    SELECT
        child.id AS id,
        child.parent_id AS parent_id,
        gen.generation + 1 AS generation
    FROM ecoli_data AS child
        JOIN gen_info AS gen
            ON child.parent_id = gen.id
),
  
child_count AS (
    SELECT
        parent.id AS id,
        COUNT(child.id) AS child_count
    FROM ecoli_data AS parent
        LEFT JOIN ecoli_data AS child
            ON parent.id = child.parent_id
    GROUP BY parent.id
)

-- 최종 구하는 단계
SELECT
    COUNT(*) AS count,
    gen.generation AS generation
FROM gen_info AS gen
    JOIN child_count AS child_count
        ON gen.id = child_count.id
WHERE 1=1
    AND child_count.child_count = 0
GROUP BY generation
ORDER BY generation
