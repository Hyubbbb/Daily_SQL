WITH RECURSIVE generation AS (
    SELECT 
        id,
        1 AS generation
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NULL
    
    UNION ALL
    
    SELECT
        child.id,
        generation + 1 AS generation
    FROM generation AS parent
        JOIN ecoli_data AS child
            ON parent.id = child.parent_id
)

SELECT
    COUNT(id) AS count,
    generation
FROM generation gen
WHERE 1=1
    AND NOT EXISTS (
        SELECT 
            id
        FROM ecoli_data
        WHERE parent_id = gen.id
    )
GROUP BY generation
ORDER BY generation
