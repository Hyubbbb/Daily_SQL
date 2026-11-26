WITH sales_groupby AS (
    SELECT
        category,
        sub_category,
        SUM(sales) AS sales_sub_category,
        SUM(SUM(sales)) OVER (PARTITION BY category) AS sales_category,
        SUM(SUM(sales)) OVER () AS sales_total
    FROM records
    GROUP BY category, sub_category
)
SELECT 
    category,
    sub_category,
    ROUND(sales_sub_category, 2) AS sales_sub_category,
    ROUND(sales_category, 2) AS sales_category,
    ROUND(sales_total, 2) AS sales_total,
    ROUND(100 * sales_sub_category / sales_category, 2) AS pct_in_category,
    ROUND(100 * sales_sub_category / sales_total, 2) AS pct_in_total
FROM sales_groupby