WITH RECURSIVE ecoli_gen AS (
    SELECT
        id,
        1 AS generation
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NULL
    
    UNION ALL

    SELECT
        ch.id,
        pr.generation + 1 AS generation
    FROM ecoli_data AS ch
        JOIN ecoli_gen AS pr
            ON ch.parent_id = pr.id
)

SELECT
    id
FROM ecoli_gen
WHERE 1=1
   AND generation = 3
ORDER BY id ASC;
