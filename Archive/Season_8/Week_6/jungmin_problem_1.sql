-- programmers (SUM, MAX, MIN) : 연도별 대장균 크기의 편차 구하기 (LEVEL 2)
WITH max_size AS(
    SELECT
        id,
        YEAR(differentiation_date) AS year,
        MAX(size_of_colony) OVER (PARTITION BY YEAR(differentiation_date)) AS max_size
    FROM ecoli_data
)

SELECT
    YEAR(differentiation_date) AS year,
    max_size - size_of_colony AS year_dev,
    id
FROM ecoli_data
    JOIN max_size
        USING(id)
ORDER BY year ASC, year_dev ASC;
