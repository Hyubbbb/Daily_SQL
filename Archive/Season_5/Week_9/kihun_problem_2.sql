-- https://school.programmers.co.kr/learn/courses/30/lessons/299310
SELECT 
    YEAR(differentiation_date) year,
    (year_max - size_of_colony) year_dev,
    id
FROM 
    (SELECT 
        *,
        MAX(size_of_colony) OVER (PARTITION BY YEAR(differentiation_date)) year_max
    FROM
        ecoli_data) t
ORDER BY
    1, 2;