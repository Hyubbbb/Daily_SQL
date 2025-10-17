-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
SELECT 
    ROUND(AVG(lat_n), 4) AS median
FROM (
    SELECT 
        lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) AS rn,
        COUNT(*) OVER () AS total
    FROM STATION
) AS t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));
