SELECT
    curr.n,
    CASE
        WHEN curr.p IS NULL
            THEN 'Root'
        WHEN child.p IS NOT NULL
            THEN 'Inner'
        ELSE 'Leaf'
    END AS node_type
FROM bst AS curr
    LEFT JOIN bst AS child
        ON curr.n = child.p
GROUP BY curr.n, curr.p
ORDER BY curr.n;
