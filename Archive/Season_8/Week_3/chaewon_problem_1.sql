-- https://school.programmers.co.kr/learn/courses/30/lessons/284530
SELECT 
    YEAR(ym) AS YEAR,
    ROUND(AVG(pm_val1), 2) AS PM10,
    ROUND(AVG(pm_val2), 2) AS `PM2.5`
FROM air_pollution
WHERE location2 = '수원'
GROUP BY YEAR(ym)
ORDER BY YEAR ASC;