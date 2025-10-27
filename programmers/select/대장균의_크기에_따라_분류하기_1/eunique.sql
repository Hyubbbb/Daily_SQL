SELECT e.id,
    CASE 
        WHEN e.size_of_colony <= 100 THEN 'LOW'
        WHEN e.size_of_colony <= 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS size
FROM ecoli_data as e
ORDER BY e.id;
