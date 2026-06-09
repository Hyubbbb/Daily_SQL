-- parent_id가 NULL이면 1세대
-- parent_id에 없으면 자식 존재X
WITH RECURSIVE gen_table AS (
    SELECT      -- 1세대 찾기
        id,
        parent_id,
        1 AS generation
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NULL 
    
    UNION ALL
    
    SELECT
        ecoli.id,
        ecoli.parent_id,
        gen.generation + 1 AS generation
    FROM ecoli_data AS ecoli
        JOIN gen_table AS gen
            ON ecoli.parent_id = gen.id
)

SELECT
    COUNT(*) AS count,
    gen.generation
FROM gen_table AS gen
    LEFT JOIN ecoli_data AS ch
        ON gen.id = ch.parent_id
WHERE 1=1
    AND ch.id IS NULL
GROUP BY gen.generation
ORDER BY gen.generation
