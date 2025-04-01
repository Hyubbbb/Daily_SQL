WITH TMP AS (
  SELECT DISTINCT
      category
    , sub_category
    , ROUND(SUM(sales) OVER (PARTITION BY sub_category),2) AS sales_sub_category
    , ROUND(SUM(sales) OVER (PARTITION BY category),2) AS sales_category
    , (SELECT ROUND(SUM(sales),2) FROM records) AS sales_total
  FROM records
)

SELECT
    *
  , ROUND(100.0*sales_sub_category/sales_category,2) AS pct_in_category
  , ROUND(100.0*sales_sub_category/sales_total,2) AS pct_in_total
FROM TMP
