SELECT ROUND(AVG(sum_sales),2) AS avg_sales
FROM (
  SELECT SUM(total_bill) AS sum_sales
  FROM tips
  GROUP BY day
)
