SELECT e3.id
FROM ecoli_data e1
    INNER JOIN ecoli_data e2
        ON e1.id = e2.parent_id
    INNER JOIN ecoli_data e3
        ON e2.id = e3.parent_id 
WHERE 1=1 
    AND e1.parent_id IS NULL
ORDER BY e3.id ASC;
