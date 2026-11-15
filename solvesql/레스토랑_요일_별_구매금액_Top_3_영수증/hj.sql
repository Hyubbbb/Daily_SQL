WITH ranked AS (
    SELECT
        day,
        time,
        sex,
        total_bill,
        DENSE_RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS bill_rank
    FROM tips
)
SELECT
    day,
    time,
    sex,
    total_bill
FROM ranked
WHERE 1=1
  AND bill_rank <= 3
ORDER BY day, total_bill DESC;
