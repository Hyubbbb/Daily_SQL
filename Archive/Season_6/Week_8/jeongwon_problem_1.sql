# 1070. Product Sales Analysis III
# https://leetcode.com/problems/product-sales-analysis-iii/

SELECT
  s.product_id,
  s.year AS first_year,
  s.quantity,
  s.price
FROM Sales s
JOIN (
  SELECT
    product_id,
    MIN(year) AS first_year
  FROM Sales
  GROUP BY product_id
) AS first_sale
ON s.product_id = first_sale.product_id
   AND s.year = first_sale.first_year;
