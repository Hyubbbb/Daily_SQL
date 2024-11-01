-- https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true
SELECT DISTINCT(CITY)
FROM STATION
WHERE ID % 2 = 0
