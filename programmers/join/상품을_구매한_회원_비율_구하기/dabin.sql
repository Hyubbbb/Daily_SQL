-- 상품을 구매한 회원 비율 구하기
WITH base AS (
    SELECT COUNT(*) AS total_2021_users
    FROM user_info
    WHERE YEAR(joined) = 2021
)
SELECT
    YEAR(os.sales_date)  AS year,
    MONTH(os.sales_date) AS month,
    COUNT(DISTINCT ui.user_id) AS purchased_users,
    ROUND(
        COUNT(DISTINCT ui.user_id) / base.total_2021_users,
        1
    ) AS purchased_ratio
FROM online_sale AS os
JOIN user_info AS ui
  ON ui.user_id = os.user_id
CROSS JOIN base
WHERE YEAR(ui.joined) = 2021
GROUP BY YEAR(os.sales_date), MONTH(os.sales_date), base.total_2021_users
ORDER BY year, month;
