WITH unique_monthly_users AS (
    SELECT DISTINCT
        user_id,
        YEAR(sales_date) AS year,
        MONTH(sales_date) AS month
    FROM online_sale AS os
)
SELECT
    year,
    month,
    gender,
    COUNT(*) AS users
FROM user_info AS ui
    JOIN unique_monthly_users AS umu
        ON ui.user_id = umu.user_id
WHERE 1=1
    AND ui.gender IS NOT NULL
GROUP BY umu.year, umu.month, ui.gender
ORDER BY umu.year, umu.month, ui.gender