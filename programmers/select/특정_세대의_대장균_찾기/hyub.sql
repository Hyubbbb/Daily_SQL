WITH RECURSIVE cte_gen AS (
    -- Non-Recursvie
    SELECT 
        ed1.id,
        ed1.parent_id,
        1 AS gen
    FROM ecoli_data AS ed1
    WHERE parent_id IS NULL

    UNION ALL
    
    -- Recursvie
    SELECT
        ed2.id,
        ed2.parent_id,
        cg.gen + 1 AS gen
    FROM ecoli_data AS ed2
        JOIN cte_gen AS cg
            ON ed2.parent_id = cg.id
)
SELECT 
    id
FROM cte_gen
WHERE 1=1
    AND gen = 3
ORDER BY id
