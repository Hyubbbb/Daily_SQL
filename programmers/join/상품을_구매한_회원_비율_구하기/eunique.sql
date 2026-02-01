WITH base AS (
    SELECT
        YEAR(o.sales_date)  AS YEAR,
        MONTH(o.sales_date) AS MONTH,
        COUNT(DISTINCT o.user_id) AS PURCHASED_USERS,
        (SELECT COUNT(*)
         FROM USER_INFO
         WHERE 1=1
            AND JOINED BETWEEN '2021-01-01' AND '2021-12-31') AS TOTAL_USERS
    FROM ONLINE_SALE o
        JOIN USER_INFO u
            ON o.user_id = u.user_id
         AND u.joined BETWEEN '2021-01-01' AND '2021-12-31'
    GROUP BY YEAR(o.sales_date), MONTH(o.sales_date)
)
SELECT
    YEAR,
    MONTH,
    PURCHASED_USERS,
    ROUND(PURCHASED_USERS / TOTAL_USERS, 1) AS PUCHASED_RATIO
FROM base
ORDER BY YEAR, MONTH;
