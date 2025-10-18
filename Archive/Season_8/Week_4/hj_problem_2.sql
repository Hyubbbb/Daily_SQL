-- https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true
SELECT 
    MIN(start_date) AS start_date,
    MAX(end_date) AS end_date
FROM (
    SELECT 
        start_date,
        end_date, 
        DATE_SUB(start_date, INTERVAL ROW_NUMBER() OVER (ORDER BY start_date) DAY) AS grp    
    FROM projects
) AS p
GROUP BY grp
ORDER BY 
    DATEDIFF(MAX(end_date), MIN(start_date)), 
    MIN(start_date);
