SELECT
    b.n,
    CASE
        WHEN b.p IS NULL
            THEN 'Root'
        WHEN COUNT(c.n) > 0
            THEN 'Inner'
        ELSE 'Leaf'
    END AS node_type
FROM bst AS b
    LEFT JOIN bst AS c
        ON b.n = c.p
GROUP BY b.n, b.p
ORDER BY b.n;
