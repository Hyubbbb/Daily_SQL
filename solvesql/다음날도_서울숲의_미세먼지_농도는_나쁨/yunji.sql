SELECT
    m1.measured_at AS today,
    m2.measured_at AS next_day,
    m1.pm10 AS pm10,
    m2.pm10 AS next_pm10
FROM measurements AS m1
    JOIN measurements AS m2
        ON m2.measured_at = DATE_ADD(m1.measured_at, INTERVAL 1 DAY)
WHERE 1=1
    AND m2.pm10 > m1.pm10
ORDER BY m1.measured_at;
