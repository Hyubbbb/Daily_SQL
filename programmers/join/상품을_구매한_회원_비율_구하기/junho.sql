WITH members AS (
    SELECT user_id
    FROM user_info
    WHERE 1=1
        AND joined LIKE '2021%'
)   
SELECT
    YEAR(sales_date) AS year,
    MONTH(sales_date) AS month,
    COUNT(DISTINCT user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT user_id) / (SELECT COUNT(user_id) FROM members), 1) AS purchased_ratio
FROM online_sale
WHERE 1=1
    AND user_id IN (SELECT user_id FROM members)
GROUP BY year, month
ORDER BY year, month
