WITH RECURSIVE ecoli AS (
    SELECT 
        id,
        parent_id,
        1 AS generation
    FROM ecoli_data
    WHERE parent_id IS NULL

    UNION ALL

    SELECT 
        e.id,
        e.parent_id,
        r.generation + 1
    FROM ecoli_data e
        JOIN ecoli r
            ON e.parent_id = r.id
)

SELECT 
    COUNT(*) AS COUNT,
    generation
FROM ecoli AS e
    LEFT JOIN ecoli_data AS ed
        ON e.id = ed.parent_id
WHERE ed.id IS NULL
GROUP BY generation
ORDER BY generation;