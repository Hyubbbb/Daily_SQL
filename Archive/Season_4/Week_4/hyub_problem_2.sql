-- https://solvesql.com/problems/finedust-seasonal-summary/

SELECT
  CASE 
  WHEN measured_at BETWEEN '2022-03-01' AND '2022-05-31' THEN 'spring'
  WHEN measured_at BETWEEN '2022-06-01' AND '2022-08-31' THEN 'summer'
  WHEN measured_at BETWEEN '2022-09-01' AND '2022-11-30' THEN 'autumn'
  ELSE 'winter'
  END AS season,
  ROUND(MEDIAN(pm10), 2) AS pm10_median,
  ROUND(AVG(pm10), 2) AS pm10_average

FROM measurements

GROUP BY season
