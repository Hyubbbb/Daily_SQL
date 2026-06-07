-- https://solvesql.com/problems/find-tables-with-high-bill/
WITH avg_table AS (
SELECT AVG(total_bill) AS avg_bill
FROM tips
)

SELECT *
FROM tips
WHERE total_bill > (SELECT avg_bill FROM avg_table)
