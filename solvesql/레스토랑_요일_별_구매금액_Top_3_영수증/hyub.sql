WITH tips_ranked AS (
    SELECT
        day,
        time,
        sex,
        total_bill,
        DENSE_RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS rk
    FROM tips
)
SELECT
    day,
    time,
    sex,
    total_bill
FROM tips_ranked
WHERE 1=1
    AND rk <= 3