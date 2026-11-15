WITH ranked_tip AS (
    SELECT
        day,
        time,
        sex,
        total_bill,
        DENSE_RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS dr
    FROM tips
)

SELECT
    day,
    time,
    sex,
    total_bill
FROM ranked_tip
WHERE 1=1
    AND dr <= 3
ORDER BY day, total_bill DESC;
