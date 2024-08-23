/* HackerRank Weather Observation Station 2
https://www.hackerrank.com/challenges/weather-observation-station-2/submissions/code/318919326 */

select round(sum(LAT_N), 2), round(sum(LONG_W), 2)
from station