SELECT
    n,
    CASE 
        WHEN p IS NULL
            THEN 'Root'
        WHEN n IN (
            SELECT
                p
            FROM bst
            WHERE 1=1
                AND p IS NOT NULL
        )
            THEN 'Inner'
        ELSE 'Leaf'
    END
FROM bst
ORDER BY n;

