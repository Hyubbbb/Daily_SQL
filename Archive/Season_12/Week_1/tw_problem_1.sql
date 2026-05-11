-- 데이터리안 SQL 캠프 실전반
-- 레스토랑의 일일 평균 매출액 계산하기

WITH daily AS (
  SELECT day, SUM(total_bill) as daily_bill
  FROM tips
  GROUP BY day)

SELECT ROUND(AVG(daily_bill), 2) AS avg_sales
FROM daily
