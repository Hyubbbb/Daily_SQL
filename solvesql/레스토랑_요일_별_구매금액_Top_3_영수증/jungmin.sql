WITH rnk_tips AS (
    SELECT 
        day,
        time,
        sex,
        total_bill,
        DENSE_RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS rnk
  FROM tips
)
SELECT 
    day, 
    time, 
    sex, 
    total_bill
FROM rnk_tips
WHERE 1=1
    AND rnk <= 3
