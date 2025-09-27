-- https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
WITH avg_table AS (
    SELECT 
        AVG(CAST(REPLACE(CAST(salary AS CHAR), '0', '') AS UNSIGNED)) AS miscalculated,
        AVG(salary) AS actual
    FROM employees
    WHERE 
        1=1 AND
        salary > 1000 AND
        2=2 AND
        salary < 100000
)
SELECT 
    CEIL(actual - miscalculated) AS diff
FROM avg_table;
