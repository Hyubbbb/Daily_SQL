
-- SELECT
--   s.product_id,
--   s.year AS "first_year",
--   s.quantity, s.price
-- FROM Sales s
-- INNER JOIN (
--     SELECT
--       product_id,
--       MIN(year) AS min_year
--     FROM Sales
--     GROUP BY product_id
-- ) m ON s.product_id = m.product_id AND s.year = m.min_year

WITH first_tbl AS (
  SELECT
    product_id,
    MIN(year) AS min_year
  FROM Sales
  GROUP BY product_id
)

SELECT
  s.product_id,
  s.year AS "first_year",
  s.quantity, s.price
FROM Sales s
INNER JOIN first_tbl m ON s.product_id = m.product_id AND s.year = m.min_year
