SELECT *
FROM tips
WHERE total_bill > (SELECT AVG(total_bill) FROM tips)
