WITH RECURSIVE tmp AS (
    SELECT
        ed.id,
        ed.parent_id,
        1 AS generation
    FROM ecoli_data AS ed
    WHERE 1 = 1
        AND ed.parent_id IS NULL

    UNION ALL

    SELECT
        ed.id,
        ed.parent_id,
        tmp.generation + 1 AS generation
    FROM tmp
        JOIN ecoli_data AS ed
            ON tmp.id = ed.parent_id
),
parent_tmp AS (
    SELECT DISTINCT
        parent_id
    FROM tmp
    WHERE 1 = 1
        AND parent_id IS NOT NULL
)

SELECT
    COUNT(*) AS count,
    tmp.generation
FROM tmp
    LEFT JOIN parent_tmp AS pt
        ON tmp.id = pt.parent_id
WHERE 1 = 1
    AND pt.parent_id IS NULL
GROUP BY
    tmp.generation
ORDER BY tmp.generation
