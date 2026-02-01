-- 코드를 입력하세요
WITH pr AS (
    SELECT 
       count(*) AS pr
    FROM user_info
      WHERE 1=1 
        AND YEAR(joined) = '2021'
)

SELECT
  YEAR(os.sales_date) AS 'year',
  MONTH(os.sales_date) AS 'month',
  COUNT(DISTINCT os.user_id) AS purchased_users,
  ROUND(
    COUNT(DISTINCT os.user_id) / (SELECT pr FROM pr), 1
    ) AS puchased_ratio
FROM online_sale AS os
  JOIN user_info AS ui
    ON os.user_id = ui.user_id
WHERE 1=1
  AND YEAR(ui.joined) = '2021'
GROUP BY year, month
ORDER BY year, month
