SELECT
    YEAR(differentiation_date) AS year,
    (MAX(size_of_colony) OVER (PARTITION BY YEAR(differentiation_date)) - size_of_colony) AS year_dev,
    id
FROM ecoli_data
ORDER BY year, year_dev