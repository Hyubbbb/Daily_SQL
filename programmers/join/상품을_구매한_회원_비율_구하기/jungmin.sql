WITH cnt AS (
    SELECT COUNT(*) AS cnt
    FROM user_info
    WHERE 1=1
        AND joined BETWEEN '2021-01-01' AND '2021-12-31'
)

SELECT
    DATE_FORMAT(o.sales_date, '%Y') AS year,
    DATE_FORMAT(o.sales_date, '%m') AS month,
    COUNT(DISTINCT o.user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT o.user_id) / c.cnt, 1) AS purchased_ratio
FROM user_info AS u
    JOIN online_sale AS o
        ON u.user_id = o.user_id
    CROSS JOIN cnt AS c
WHERE 1=1
    AND u.joined BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY year, month
ORDER BY year, month;
