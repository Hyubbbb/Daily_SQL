-- 2021년에 가입한 회원 목록
WITH join_2021 AS (
    SELECT
        user_id
    FROM user_info
    WHERE 1=1
        AND YEAR(joined) = 2021
),
-- 2021년에 가입한 회원 수
cnt_2021 AS (
    SELECT
        COUNT(user_id) AS cnt
    FROM join_2021
)

SELECT
    YEAR(o.sales_date) AS year,
    MONTH(o.sales_date) AS month,
    COUNT(DISTINCT o.user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT o.user_id) / c.cnt, 1) AS puchased_ratio
FROM join_2021 AS j
    JOIN online_sale AS o
        ON j.user_id = o.user_id
    CROSS JOIN cnt_2021 AS c
GROUP BY
    YEAR(o.sales_date), 
    MONTH(o.sales_date)
ORDER BY year, month;
