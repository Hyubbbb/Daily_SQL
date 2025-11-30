-- https://school.programmers.co.kr/learn/courses/30/lessons/131534

SELECT
    YEAR(os.sales_date)                      AS year,
    MONTH(os.sales_date)                     AS month,
    COUNT(DISTINCT os.user_id)              AS purchased_users,
    ROUND(
        COUNT(DISTINCT os.user_id) * 1.0
        / (
            SELECT
                COUNT(*) 
            FROM user_info AS ui2
            WHERE 1=1
                AND ui2.joined BETWEEN '2021-01-01' AND '2021-12-31'
        ),
        1
    )                                        AS purchased_ratio
FROM user_info AS ui
JOIN online_sale AS os
    ON os.user_id = ui.user_id
WHERE 1=1
    AND ui.joined BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY
    YEAR(os.sales_date),
    MONTH(os.sales_date)
ORDER BY
    year  ASC,
    month ASC;
