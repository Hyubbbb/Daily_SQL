WITH join_2021 AS ( -- 2021에 가입한 회원
    SELECT
        user_id
    FROM user_info
    WHERE 1=1
        AND joined BETWEEN '2021-01-01' AND '2021-12-31'
)

SELECT
    YEAR(os.sales_date) AS year,
    MONTH(os.sales_date) AS month,
    COUNT(DISTINCT j.user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT j.user_id) / (SELECT COUNT(user_id) FROM join_2021) , 1) AS puchased_ratio
FROM join_2021 AS j
    JOIN online_sale AS os
        ON j.user_id = os.user_id
GROUP BY year, month
ORDER BY year, month
