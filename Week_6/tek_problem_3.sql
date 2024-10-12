/* HackerRank Weather Observation Station 19
https://www.hackerrank.com/challenges/weather-observation-station-19/submissions/code/320248996 */

SELECT ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N), 2) + POW(MAX(LONG_W)-MIN(LONG_W), 2)), 4)
FROM STATION