/* HackerRank Weather Observation Station 5
https://www.hackerrank.com/challenges/weather-observation-station-5/submissions/code/318759357 */ 

(select city, char_length(city)
from station
order by char_length(city), city
limit 1)
UNION
(select city, char_length(city)
from station
order by char_length(city) desc, city
limit 1)