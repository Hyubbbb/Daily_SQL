SELECT today.id
FROM Weather today
    JOIN Weather yesterday ON today.recordDate - INTERVAL 1 DAY = yesterday.recordDate
WHERE today.temperature > yesterday.temperature
