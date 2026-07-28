-- https://solvesql.com/problems/bad-finddust-days-in-a-row/
WITH pm10_lag AS (
    SELECT
        *,
        LAG(pm10, 1) OVER (ORDER BY measured_at) AS pm10_before1,
        LAG(pm10, 2) OVER (ORDER BY measured_at) AS pm10_before2
    FROM measurements
)
SELECT measured_at AS date_alert
FROM pm10_lag
WHERE 1=1
    AND pm10 >= 30
    AND pm10 > pm10_before1
    AND pm10_before1 > pm10_before2
ORDER BY date_alert;
