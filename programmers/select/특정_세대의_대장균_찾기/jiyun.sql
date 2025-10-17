WITH RECURSIVE generation_table AS(
    SELECT 
        id,
        1 AS generation
    FROM ecoli_data 
    WHERE 1=1
        AND parent_id IS NULL
    
    UNION ALL
    
    SELECT
        e.id,
        g.generation + 1 # 부모 세대 + 1
    FROM ecoli_data AS e
        JOIN generation_table AS g
            ON e.parent_id = g.id
)

SELECT id
FROM generation_table
WHERE 1=1
    AND generation = 3
ORDER BY id
