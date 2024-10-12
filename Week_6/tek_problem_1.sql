/* HackerRank Weather Observation Station 18
https://www.hackerrank.com/challenges/weather-observation-station-18/submissions/code/320247257 */

SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION