WITH total_sales AS (
    SELECT SUM(sale_amount) as company_total
    FROM sales
    WHERE sale_date >= '2025-01-01'
)
SELECT 
    s.category,
    SUM(s.sale_amount) as category_sales,
    t.company_total,
    ROUND(SUM(s.sale_amount) * 100.0 / t.company_total, 2) as market_share
FROM sales s, total_sales t
WHERE s.sale_date >= '2025-01-01'
GROUP BY s.category, t.company_total
HAVING SUM(s.sale_amount) * 100.0 / t.company_total >= 15
ORDER BY market_share DESC;