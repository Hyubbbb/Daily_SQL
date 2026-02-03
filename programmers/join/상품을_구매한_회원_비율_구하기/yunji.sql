WITH join_2021 AS (
    SELECT user_id
    FROM user_info
    WHERE 1=1
        AND YEAR(joined) = 2021
),
total_2021 AS (
    SELECT
        COUNT(*) AS total_users
    FROM join_2021
)

SELECT
    YEAR(os.sales_date)  AS year, 
    MONTH(os.sales_date) AS month, 
    COUNT(DISTINCT os.user_id) AS purchased_users, 
    ROUND(COUNT(DISTINCT os.user_id) / t.total_users, 1) AS purchased_ratio
FROM online_sale AS os
  JOIN join_2021 AS j
      ON os.user_id = j.user_id
  CROSS JOIN total_2021 AS t
GROUP BY
    year, 
    month, 
    t.total_users
ORDER BY
    year, 
    month;
