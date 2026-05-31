SELECT
    today.measured_at AS today,
    next_day.measured_at AS next_day,
    today.pm10 AS pm10,
    next_day.pm10 AS next_pm10
FROM measurements AS today
    JOIN measurements AS next_day
        ON today.measured_at + INTERVAL 1 DAY = next_day.measured_at
WHERE today.pm10 < next_day.pm10
