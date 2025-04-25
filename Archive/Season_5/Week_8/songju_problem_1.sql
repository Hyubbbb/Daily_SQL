-- https://solvesql.com/problems/tip-analysis/

SELECT
    day,
    time,
    ROUND(AVG(tip), 2) AS avg_tip,
    ROUND(AVG(size), 2) AS avg_size
FROM
    tips
GROUP BY
    day, time
ORDER BY
    day, time;
