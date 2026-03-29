SELECT
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    ui.gender AS gender,
    COUNT(DISTINCT os.user_id) AS users
FROM online_sale AS os
    JOIN user_info AS ui
        ON os.user_id = ui.user_id
WHERE 1=1
    AND ui.gender IS NOT NULL
GROUP BY year, month, gender
ORDER BY year, month, gender;
