-- https://solvesql.com/problems/weekday-stats-airpollution/

SELECT 
  -- (CAST(strftime('%w', measured_at) AS INTEGER) + 6) % 7 AS weekday,
  substr('월요일화요일수요일목요일금요일토요일일요일',
           ((CAST(strftime('%w', measured_at) AS INTEGER) + 6) % 7) * 3 + 1, 3) AS weekday,
  ROUND(AVG(no2), 4) AS no2,
  ROUND(AVG(o3), 4) AS o3,
  ROUND(AVG(co), 4) AS co,
  ROUND(AVG(so2), 4) AS so2,
  ROUND(AVG(pm10), 4) AS pm10,
  ROUND(AVG(pm2_5), 4) AS pm2_5

FROM measurements
GROUP BY (CAST(strftime('%w', measured_at) AS INTEGER) + 6) % 7
