SELECT * 
FROM (
  SELECT 
   measured_at AS today
   , LEAD(measured_at) OVER (ORDER BY measured_at) AS next_day
   , pm10
   , LEAD(pm10) OVER (ORDER BY measured_at) AS next_pm10
  FROM measurements
  )
WHERE pm10 < next_pm10
