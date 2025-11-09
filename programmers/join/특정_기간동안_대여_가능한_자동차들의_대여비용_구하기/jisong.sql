SELECT
    c.car_id        AS car_id,
    c.car_type      AS car_type,
    ROUND(c.daily_fee * 30 * (1 - dp.discount_rate / 100.0)) AS fee
FROM car_rental_company_car AS c
JOIN car_rental_company_discount_plan AS dp
    ON dp.car_type = c.car_type
    AND dp.duration_type = '30일 이상'
WHERE 1=1
    -- 대상 차종
    AND c.car_type IN ('세단', 'SUV')
    -- 기간 동안 예약과 겹치지 않는 차량만 (대여 가능)
    AND NOT EXISTS (
        SELECT
            1
        FROM car_rental_company_rental_history AS rh
        WHERE 1=1
            AND rh.car_id = c.car_id
            AND rh.start_date <= '2022-11-30'
            AND rh.end_date   >= '2022-11-01'
    )
    -- 30일 총 대여 금액 필터
    AND ROUND(c.daily_fee * 30 * (1 - dp.discount_rate / 100.0)) BETWEEN 500000 AND 1999999
ORDER BY
    fee DESC,
    c.car_type ASC,
    c.car_id DESC;
