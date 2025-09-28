SELECT
    id,
    CASE 
        WHEN PERCENT_RANK() OVER(ORDER BY size_of_colony DESC) <= 0.25 THEN 'CRITICAL'
        WHEN PERCENT_RANK() OVER(ORDER BY size_of_colony DESC) <= 0.50 THEN 'HIGH'
        WHEN PERCENT_RANK() OVER(ORDER BY size_of_colony DESC) <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS colony_name
FROM ecoli_data
ORDER BY id;
