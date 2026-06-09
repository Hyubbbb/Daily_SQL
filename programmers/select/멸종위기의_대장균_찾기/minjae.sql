WITH RECURSIVE generation_data AS (
    SELECT 
        id, 
        parent_id, 
        1 AS generation
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NULL

    UNION ALL

    SELECT 
        child.id, 
        child.parent_id, 
        parent.generation + 1 AS generation
    FROM ecoli_data AS child
        INNER JOIN generation_data AS parent
            ON child.parent_id = parent.id
)

SELECT 
    COUNT(gen.id) AS count,
    gen.generation
FROM generation_data AS gen 
    LEFT JOIN ecoli_data AS parent_check 
        ON gen.id = parent_check.parent_id 
WHERE 1=1
    AND parent_check.parent_id IS NULL
GROUP BY gen.generation
ORDER BY gen.generation;
