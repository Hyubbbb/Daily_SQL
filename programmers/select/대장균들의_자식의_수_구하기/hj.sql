SELECT 
    p.id AS id,
    COUNT(c.id) AS child_count
FROM ecoli_data AS p
LEFT JOIN ecoli_data AS c
    ON p.id = c.parent_id
GROUP BY p.id
ORDER BY p.id ASC;
