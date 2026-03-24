SELECT
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    ui.gender,
    COUNT(DISTINCT ui.user_id) AS users
FROM user_info AS ui
    INNER JOIN online_sale AS os
        ON ui.user_id = os.user_id
WHERE 1=1
    AND gender IS NOT NULL
GROUP BY year, month, ui.gender
ORDER BY year, month, ui.gender
