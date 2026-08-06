-- https://solvesql.com/problems/revenue-weekday-weekend/
WITH week_tbl AS (
    SELECT
        CASE
            WHEN day = 'Sat' OR day = 'Sun'
                THEN 'weekend'
            ELSE 'weekday'
        END AS week,
        total_bill
    FROM tips
)
SELECT
    week,
    SUM(total_bill) AS sales
FROM week_tbl
GROUP BY week
ORDER BY sales DESC;
