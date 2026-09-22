SELECT
    n,
    CASE
        WHEN p IS NULL -- Root: haven't parent
            THEN 'Root'
        WHEN n IN (SELECT DISTINCT p FROM bst WHERE p IS NOT NULL) -- Inner: haven't parent & have child
            THEN 'Inner'
        ELSE 'Leaf' -- Leaf: have parent & haven't child
    END AS value
FROM bst
ORDER BY n