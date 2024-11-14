-- https://solvesql.com/problems/bad-finedust-measure/

WITH today_nextday AS(
  SELECT measured_at AS today, pm10, LEAD(measured_at) OVER() AS next_day, LEAD(pm10) OVER() AS next_pm10
  FROM measurements)

SELECT *
FROM today_nextday
WHERE pm10 < next_pm10
