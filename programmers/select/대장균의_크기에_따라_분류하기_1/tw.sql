SELECT
    id,
    CASE 
        WHEN size_of_colony <= 100 THEN 'low'
        WHEN 1000 < size_of_colony THEN 'high'
        ELSE 'medium'
    END AS SIZE
FROM ecoli_data
ORDER BY 1
