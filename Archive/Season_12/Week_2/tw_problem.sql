-- https://solvesql.com/problems/high-season-of-restaurant/
-- 레스토랑의 대목
WITH day_income AS(
  SELECT
    day,
    SUM(total_bill) AS day_bill
  FROM tips
  GROUP BY day)

SELECT main.day, total_bill, tip, sex, smoker, main.time, size
FROM day_income AS branch
  JOIN tips AS main
    ON branch.day = main.day
WHERE branch.day_bill >= 1500
