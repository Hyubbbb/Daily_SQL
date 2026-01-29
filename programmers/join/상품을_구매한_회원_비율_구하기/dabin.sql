-- 상품을 구매한 회원 비율 구하기
SELECT
    YEAR(os.sales_date) AS YEAR,
    MONTH(os.sales_date) AS MONTH,
    COUNT(DISTINCT ui.user_id) AS PURCHASED_USERS,
    ROUND(
        COUNT(DISTINCT ui.user_id) /
        (SELECT COUNT(*) 
         FROM user_info
         WHERE YEAR(joined) = 2021),
        1) AS PUCHASED_RATIO
FROM online_sale AS os
INNER JOIN user_info AS ui
    ON ui.user_id = os.user_id
WHERE YEAR(ui.JOINED) = 2021
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;
