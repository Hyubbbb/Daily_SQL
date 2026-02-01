WITH joined_2021 AS (
    SELECT
        user_id
    FROM user_info
    WHERE joined >= '2021-01-01'
      AND joined <  '2022-01-01'
),

total_joined AS (
    SELECT
        COUNT(*) AS total_users
    FROM joined_2021
),

monthly_purchasers AS (
    SELECT
        DATE_FORMAT(os.sales_date, '%Y-%m') AS ym,
        COUNT(DISTINCT os.user_id) AS purchased_users
    FROM online_sale AS os
        JOIN joined_2021 AS j
            ON j.user_id = os.user_id
    GROUP BY DATE_FORMAT(os.sales_date, '%Y-%m')
)

SELECT
    YEAR(mp.ym) AS year,
    MONTH(mp.ym) AS month,
    mp.purchased_users,
    ROUND(mp.purchased_users / NULLIF(tj.total_users, 0), 1) AS purchased_ratio
FROM monthly_purchasers AS mp
    CROSS JOIN total_joined tj
ORDER BY year, month;
