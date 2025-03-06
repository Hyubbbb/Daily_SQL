SELECT day, time, sex, total_bill
FROM (
  SELECT *
    ,DENSE_RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS rank_bill
  FROM tips
)
WHERE rank_bill <= 3
