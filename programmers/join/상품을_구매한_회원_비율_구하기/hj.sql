WITH user_2021 AS (
    SELECT
        user_id
    FROM user_info
    WHERE 1=1
        AND YEAR(joined) = 2021
), 
cnt_2021 AS (
    SELECT 
        COUNT(user_id) AS cnt
    FROM user_2021
)
    
SELECT
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    COUNT(DISTINCT u.user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT u.user_id) / c.cnt , 1) AS puchased_ratio
FROM user_2021 AS u
    JOIN online_sale AS os
        ON u.user_id = os.user_id
    CROSS JOIN cnt_2021 AS c
GROUP BY year, month
ORDER BY year, month;
