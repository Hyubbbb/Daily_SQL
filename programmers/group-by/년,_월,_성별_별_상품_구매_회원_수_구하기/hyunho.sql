-- 년, 월별 유저 ID(중복 제거) user distinct--
WITH user_distinct AS (
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
    COUNT(ui.user_id) AS users
FROM user_info AS ui
    JOIN user_distinct AS ud
        ON ui.user_id = ud.user_id
WHERE 1=1
    AND ui.gender IS NOT NULL
GROUP BY year, month, ui.gender
ORDER BY year, month, ui.gender;