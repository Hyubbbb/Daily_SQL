SELECT
    *,
    CASE
        WHEN GREATEST(x, y, z) * 2 >= x+y+z THEN 'No'
        ELSE 'Yes'
    END AS triangle    
FROM Triangle
