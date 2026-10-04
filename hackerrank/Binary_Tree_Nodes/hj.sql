WITH parent_node AS (
    SELECT DISTINCT p
    FROM bst
    WHERE 1=1
        AND p IS NOT NULL
)
SELECT
    b.n,
    CASE
        WHEN b.p IS NULL
            THEN 'Root'
        WHEN p.p IS NULL
            THEN 'Leaf'
        ELSE 'Inner'
    END
FROM bst b
    LEFT JOIN parent_node p
        ON b.n = p.p
ORDER BY b.n;
