WITH users_date AS (
    SELECT DISTINCT
        YEAR(os.sales_date) AS year,
        MONTH(os.sales_date) AS month,
        os.user_id
    FROM online_sale AS os
)

SELECT
    ud.year,
    ud.month,
    ui.gender,
    COUNT(ud.user_id) AS users
FROM users_date AS ud
    JOIN user_info AS ui
        ON ud.user_id = ui.user_id
WHERE 1=1
    AND ui.gender IS NOT NULL
GROUP BY ud.year, ud.month, ui.gender
ORDER BY ud.year, ud.month, ui.gender;
