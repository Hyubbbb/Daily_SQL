SELECT 
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    gender,
    COUNT(DISTINCT os.user_id) AS users
FROM online_sale AS os
    LEFT JOIN user_info AS ui
        ON os.user_id = ui.user_id
WHERE 1 = 1
    AND ui.gender IS NOT NULL
GROUP BY YEAR(os.sales_date), MONTH(os.sales_date), ui.gender
ORDER BY year, month, ui.gender;
