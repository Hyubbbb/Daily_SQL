-- https://solvesql.com/problems/find-tables-with-high-bill/
WITH avg_bill AS (
    SELECT AVG(total_bill) AS avg_bill
    FROM tips
)

SELECT t.*
FROM tips AS t
  INNER JOIN avg_bill AS a
    ON 1=1
WHERE t.total_bill > a.avg_bill;

-- SELECT *
-- FROM tips
-- WHERE total_bill > (SELECT AVG(total_bill) FROM tips);
