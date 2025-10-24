SELECT
    id,
    CASE
        WHEN size_of_colony <= 100 THEN 'LOW'
        WHEN size_of_colony > 100 AND size_of_colony <= 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS size
FROM ecoli_data
ORDER BY id ASC;
