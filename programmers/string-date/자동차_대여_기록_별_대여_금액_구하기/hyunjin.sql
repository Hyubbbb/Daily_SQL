-- 코드를 입력하세요
WITH duration_group AS (
  SELECT 
    ch.car_id,
    ch.history_id,
    cc.car_type,
    DATEDIFF(ch.end_date, ch.start_date)+1 AS duration,
    cc.daily_fee,
    CASE 
      WHEN DATEDIFF(ch.end_date, ch.start_date)+1 >= 90 THEN '90일 이상'
      WHEN DATEDIFF(ch.end_date, ch.start_date)+1 >= 30 THEN '30일 이상'
      WHEN DATEDIFF(ch.end_date, ch.start_date)+1 >= 7 THEN '7일 이상'
      ELSE NULL
    END AS duration_type
  FROM car_rental_company_rental_history AS ch
    JOIN car_rental_company_car AS cc
      ON cc.car_id = ch.car_id
  WHERE 1=1
    AND cc.car_type = '트럭'
)

SELECT 
   dg.history_id,
   ROUND((dg.duration * dg.daily_fee) - ((dg.duration * dg.daily_fee) * IFNULL(cp.discount_rate, 0)/100)) AS fee
FROM duration_group AS dg
  LEFT JOIN car_rental_company_discount_plan AS cp
    ON dg.car_type = cp.car_type
    AND dg.duration_type = cp.duration_type
ORDER BY fee DESC, dg.history_id DESC
