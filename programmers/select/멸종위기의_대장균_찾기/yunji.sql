WITH RECURSIVE g AS (
    SELECT 
        id, 
        parent_id, 
        1 AS gen 
    FROM ecoli_data 
    WHERE 1=1
        AND parent_id IS NULL
    UNION ALL
    SELECT 
        ed.id, 
        ed.parent_id, 
        g.gen+1 
    FROM ecoli_data AS ed
    JOIN g
        ON ed.parent_id = g.id
)
  
SELECT 
     COUNT(*) AS count,
    g.gen AS generation
FROM G AS g
LEFT JOIN ecoli_data AS ed
    ON g.id = ed.parent_id
WHERE 1=1
    AND ed.id IS NULL
GROUP BY g.gen
ORDER BY g.gen;
