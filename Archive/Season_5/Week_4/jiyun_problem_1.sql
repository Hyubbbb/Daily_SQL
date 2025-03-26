SELECT day, SUM(total_bill) AS revenue_daily
FROM tips
GROUP BY day HAVING revenue_daily >= 1000
