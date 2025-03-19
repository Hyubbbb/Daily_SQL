SELECT total_bill, tip, sex, smoker, day, time, size
FROM (
  SELECT *, SUM(total_bill) OVER (PARTITION BY day) AS total_sales
  FROM tips
)
WHERE total_sales >= 1500
