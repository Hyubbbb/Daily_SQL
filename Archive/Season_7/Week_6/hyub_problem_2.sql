-- https://leetcode.com/problems/investments-in-2016/?envType=study-plan-v2&envId=top-sql-50
WITH _in AS (
    SELECT DISTINCT i1.pid
    FROM Insurance AS i1
    JOIN Insurance AS i2
        ON i1.tiv_2015 = i2.tiv_2015
        AND i1.pid != i2.pid
),
_notin AS (
    SELECT DISTINCT i1.pid
    FROM Insurance AS i1
    JOIN Insurance AS i2
        ON i1.pid != i2.pid
        AND i1.lat = i2.lat
        AND i1.lon = i2.lon
)
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE 1=1
    AND pid IN (SELECT pid FROM _in)
    AND pid NOT IN (SELECT pid FROM _notin)
