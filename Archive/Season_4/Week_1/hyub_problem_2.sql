-- https://solvesql.com/problems/moving-average-of-power-consumption/

SELECT
  datetime(measured_at, '+10 minutes') AS end_at,
  ROUND(AVG(zone_quads) OVER (ORDER BY measured_at ROWS BETWEEN 5 PRECEDING AND CURRENT ROW), 2) AS zone_quads,
  ROUND(AVG(zone_smir) OVER (ORDER BY measured_at ROWS BETWEEN 5 PRECEDING AND CURRENT ROW), 2) AS zone_smir,
  ROUND(AVG(zone_boussafou) OVER (ORDER BY measured_at ROWS BETWEEN 5 PRECEDING AND CURRENT ROW), 2) AS zone_boussafou
FROM power_consumptions
WHERE measured_at BETWEEN "2017-01-01" AND "2017-02-01"
