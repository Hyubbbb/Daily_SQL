WITH cnt AS (
    SELECT COUNT(*) AS cnt
    FROM user_info
    WHERE 1=1
        AND joined BETWEEN '2021-01-01' AND '2021-12-31'
)

SELECT
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    COUNT(DISTINCT os.user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT os.user_id) / c.cnt, 1) AS purchased_ratio
FROM user_info AS ui
    JOIN online_sale AS os
        ON ui.user_id = os.user_id
    CROSS JOIN cnt AS c
WHERE 1=1
    AND ui.joined BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY year, month
ORDER BY year, month
