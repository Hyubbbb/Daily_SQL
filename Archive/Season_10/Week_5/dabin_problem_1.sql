WITH RECURSIVE ecoli_tree AS (
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
        t.generation + 1
    FROM ecoli_data e
    JOIN ecoli_tree t
        ON e.parent_id = t.id
)

SELECT id
FROM ecoli_tree
WHERE generation = 3  
ORDER BY id;
