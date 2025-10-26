SELECT
    id,
    CASE 
        WHEN size_of_colony <= 100 THEN 'LOW'
        WHEN 1000 < size_of_colony THEN 'HIGH'
        ELSE 'MEDIUM'
    END AS SIZE
FROM ecoli_data
ORDER BY 1
