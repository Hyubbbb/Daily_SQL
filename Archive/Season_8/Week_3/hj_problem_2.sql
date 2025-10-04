-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
SELECT 
    ROUND(ABS(MIN(lat_n)-MAX(lat_n))+ABS(Min(long_w)-MAX(long_w)), 4) AS man_dist
FROM station;
