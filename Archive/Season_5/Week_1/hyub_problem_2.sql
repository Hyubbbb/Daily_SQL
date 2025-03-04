-- https://solvesql.com/problems/revenue-pct-per-category/

-- sub_category sales
WITH sub_sales AS (
  SELECT
    sub_category,
    SUM(sales) AS sales_sub_category
  FROM records
  GROUP BY sub_category),

-- category sales
cat_sales AS (
  SELECT
    category,
    SUM(sales) AS sales_category
  FROM records
  GROUP BY category)

-- Final Query
SELECT DISTINCT
  r.category,
  r.sub_category,
  ROUND(ss.sales_sub_category, 2) AS sales_sub_category,
  ROUND(cs.sales_category, 2) AS sales_category,
  ROUND((SELECT SUM(sales) FROM records), 2) AS sales_total,
  ROUND((sales_sub_category / sales_category) * 100, 2) AS pct_in_category,
  ROUND((sales_sub_category / (SELECT SUM(sales) FROM records)) * 100, 2) AS pct_in_total

FROM records AS r 
JOIN sub_sales AS ss
  on r.sub_category = ss.sub_category
JOIN cat_sales AS cs
  on r.category = cs.category

