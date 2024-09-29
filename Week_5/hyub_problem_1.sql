-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true

-- Babo, This is euclidean
-- SELECT ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N), 2) + POW(MAX(LONG_W)-MIN(LONG_W), 2)), 4)

SELECT ROUND(ABS(MAX(LAT_N)-MIN(LAT_N)) + ABS(MAX(LONG_W)-MIN(LONG_W)), 4)
FROM STATION
