WITH user_2021 AS (
    SELECT
        user_id
    FROM user_info
    WHERE 1=1
        AND YEAR(joined) = 2021
)

SELECT
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    COUNT(DISTINCT u.user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT u.user_id) / (SELECT COUNT(user_id) FROM user_2021) , 1) AS puchased_ratio
FROM user_2021 AS u
    JOIN online_sale AS os
        ON u.user_id = os.user_id
GROUP BY year, month
ORDER BY year, month;
