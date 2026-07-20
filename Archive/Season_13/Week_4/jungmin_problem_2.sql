-- https://solvesql.com/problems/count-stamps/
WITH stamp_table AS (
    SELECT
        *,
        CASE
            WHEN total_bill >= 25
                THEN 2
            WHEN total_bill >= 15
                THEN 1
            ELSE 0
        END AS stamp
    FROM tips
)
SELECT
    stamp,
    COUNT(*) AS count_bill
FROM stamp_table
GROUP BY stamp
ORDER BY stamp
