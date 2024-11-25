-- https://solvesql.com/problems/find-tables-with-high-bill/

SELECT *
FROM tips
WHERE total_bill > (SELECT AVG(total_bill) FROM tips)
