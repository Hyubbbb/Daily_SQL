-- https://solvesql.com/problems/main-platform-of-game-developers/
WITH
  table1 AS (
    SELECT
      developer_id,
      platform_id,
      SUM(sales_na + sales_eu + sales_jp + sales_other) AS sales_sum
    FROM
      games
    GROUP BY
      developer_id,
      platform_id
  )

SELECT 
  c.name AS developer,
  p.name AS platform,
  mv AS sales
FROM table1 t
JOIN
  (SELECT 
    developer_id,
    MAX(sales_sum) AS mv
  FROM table1
  GROUP BY developer_id) mv
    on t.developer_id = mv.developer_id
      AND t.sales_sum = mv.mv
LEFT JOIN companies c
  on t.developer_id = c.company_id
LEFT JOIN platforms p
  on t.platform_id = p.platform_id
