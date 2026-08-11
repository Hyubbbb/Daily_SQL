SELECT
    YEAR(ym) AS year,
    ROUND(AVG(pm_val1), 2) AS pm10,
    ROUND(AVG(pm_val2), 2) AS `pm2.5`
FROM air_pollution
WHERE location2 = '수원'
GROUP BY YEAR(ym)
ORDER BY year;
