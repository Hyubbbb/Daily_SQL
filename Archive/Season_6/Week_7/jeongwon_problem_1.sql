-- 상품을 구매한 회원 비율 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131534

WITH joiners AS (
  SELECT USER_ID
  FROM USER_INFO
  WHERE JOINED BETWEEN '2021-01-01' AND '2021-12-31'
),
total_users AS (
  SELECT COUNT(*) AS cnt
  FROM joiners
)
SELECT
  YEAR(os.SALES_DATE) AS YEAR,
  MONTH(os.SALES_DATE) AS MONTH,
  COUNT(DISTINCT os.USER_ID) AS PURCHASED_USERS,
  ROUND(
    COUNT(DISTINCT os.USER_ID) / total_users.cnt
  , 1) AS PURCHASED_RATIO
FROM ONLINE_SALE os
JOIN joiners j ON os.USER_ID = j.USER_ID
CROSS JOIN total_users
GROUP BY YEAR(os.SALES_DATE), MONTH(os.SALES_DATE)
ORDER BY YEAR, MONTH;
