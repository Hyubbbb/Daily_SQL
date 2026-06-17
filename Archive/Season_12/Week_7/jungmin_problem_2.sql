-- https://solvesql.com/problems/bad-finedust-measure/
WITH next_day AS (
    SELECT
        DATE_SUB(measured_at, INTERVAL 1 DAY) AS today,
        measured_at AS next_day,
        pm10 AS next_pm10
    FROM measurements
    WHERE 1=1
        AND measured_at != '2022-01-01'
)
SELECT
    tomorrow.today,
    tomorrow.next_day,
    today.pm10,
    tomorrow.next_pm10
FROM measurements AS today
    JOIN next_day AS tomorrow
        ON today.measured_at = tomorrow.today
WHERE 1=1
    AND today.pm10 < tomorrow.next_pm10
