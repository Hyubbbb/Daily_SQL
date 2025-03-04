-- https://solvesql.com/problems/top-3-bill/

WITH TMP AS (
SELECT
  total_bill,
  day,
  RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS RANK_day
FROM tips)

SELECT
  t.day,
  t.time,
  t.sex,
  t.total_bill
FROM TMP a
JOIN tips t
  on a.day = t.day
WHERE RANK_day = 3
  AND (CASE
       WHEN t.total_bill >= a.total_bill THEN 1
        ELSE 0 END)
