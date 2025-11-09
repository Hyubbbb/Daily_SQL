-- 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기 : 윤다빈
WITH w AS (
    SELECT DATE('2022-11-01') AS start_date, DATE('2022-12-01') AS end_date
),
dp AS (
    -- 할인 플랜: 30일 이상 (문제 정의 컬럼명: curation_type)
    SELECT
        d.car_type,
        COALESCE(d.discount_rate, 0) AS discount_rate
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS d
    WHERE d.duration_type = '30일 이상'
)
SELECT
    c.car_id,
    c.car_type,
    CAST(c.daily_fee * 30 * (1 - COALESCE(dp.discount_rate, 0) / 100.0) AS DECIMAL(12,0)) AS rental_fee
FROM car_rental_company_car AS c
    INNER JOIN dp
        ON c.car_type = dp.car_type
WHERE c.car_type IN ('세단', 'SUV')
  AND c.daily_fee * 30 BETWEEN 500000 AND 2000000
  AND NOT EXISTS (
        SELECT 1
        FROM car_rental_company_rental_history AS h
        CROSS JOIN w
        WHERE h.car_id = c.car_id
          -- [2022-11-01, 2022-12-01) 와 "겹치면" 배제
          AND h.start_date < w.end_date
          AND h.end_date   >= w.start_date
    )
ORDER BY
    rental_fee DESC,
    c.car_type ASC,
    c.car_id DESC;
