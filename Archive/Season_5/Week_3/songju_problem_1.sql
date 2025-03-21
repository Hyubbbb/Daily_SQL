--https://solvesql.com/problems/best-working-day/

SELECT
    day,
    ROUND(SUM(tip), 2) AS tip_daily
FROM
    tips
GROUP BY
    day
ORDER BY
    tip_daily DESC
LIMIT 1;
