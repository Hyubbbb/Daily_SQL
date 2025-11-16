-- 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기 : 윤다빈
WITH w AS (
    SELECT
        DATE('2022-11-01') AS start_date,
        DATE('2022-12-01') AS end_date
),
dp AS (
    SELECT
        d.car_type,
        COALESCE(d.discount_rate, 0) AS discount_rate
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS d
    WHERE 1 = 1
      AND d.duration_type = '30일 이상'
)
SELECT
    c.car_id,
    c.car_type,
    CAST(
        c.daily_fee * 30 * (1 - COALESCE(dp.discount_rate, 0) / 100.0)
        AS DECIMAL(12, 0)
    ) AS rental_fee
FROM CAR_RENTAL_COMPANY_CAR AS c
    INNER JOIN dp
        ON c.car_type = dp.car_type
WHERE 1 = 1
  AND c.car_type IN ('세단', 'SUV')
  AND c.daily_fee * 30 BETWEEN 500000 AND 2000000
  AND NOT EXISTS (
        SELECT
            1
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
            INNER JOIN w
                ON h.start_date < w.end_date
               AND h.end_date   >= w.start_date
        WHERE 1 = 1
          AND h.car_id = c.car_id
    )
ORDER BY
    rental_fee DESC,
    c.car_type ASC,
    c.car_id DESC;
