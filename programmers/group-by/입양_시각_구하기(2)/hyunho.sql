WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1
    FROM hours
    WHERE hour < 23
)

SELECT
    h.hour,
    COUNT(a.animal_id) AS count
FROM hours AS h
LEFT JOIN animal_outs AS a
    ON h.hour = HOUR(a.datetime)
GROUP BY h.hour
ORDER BY h.hour;