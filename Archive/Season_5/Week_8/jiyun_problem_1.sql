SELECT *
FROM tips
GROUP BY day HAVING MAX(total_bill)
