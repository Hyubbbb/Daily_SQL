WITH RECURSIVE parent AS (
    SELECT 
        id, 
        parent_id, 
        0 AS generation
    FROM ecoli_data
    WHERE 1=1 
        AND parent_id IS NULL

    UNION ALL

    SELECT 
        ed.id, 
        ed.parent_id, 
        p.generation + 1
    FROM parent AS p
    LEFT OUTER JOIN ecoli_data AS ed
        ON p.id = ed.parent_id
    WHERE 1=1
        AND p.id IS NOT NULL
)

SELECT 
    COUNT(1) AS count, 
    generation
FROM parent
WHERE 1=1
    AND id IS NULL
GROUP BY id, generation
ORDER BY generation
