-- 트럭 대여 기록
WITH truck_rental_history AS (
    SELECT
        ch.history_id,
        cr.car_type,
        cr.daily_fee,
        DATEDIFF(ch.end_date, ch.start_date) + 1 AS rental_days
    FROM car_rental_company_car AS cr
        JOIN car_rental_company_rental_history AS ch
            ON cr.car_id = ch.car_id
    WHERE 1=1
        AND cr.car_type = '트럭'
),

-- 대여일 수 변환
truck_rental_discount AS (
    SELECT
        history_id,
        car_type,
        daily_fee,
        rental_days,
        CASE
            WHEN rental_days >= 90 THEN '90일 이상'
            WHEN rental_days >= 30 THEN '30일 이상'
            WHEN rental_days >= 7  THEN '7일 이상'
            ELSE NULL
        END AS duration_type
    FROM truck_rental_history
)

-- 최종 계산
SELECT
    td.history_id,
    FLOOR(td.daily_fee * td.rental_days * (100 - IFNULL(dp.discount_rate, 0)) / 100) AS fee
FROM truck_rental_discount AS td
    LEFT JOIN car_rental_company_discount_plan AS dp
        ON td.car_type = dp.car_type
            AND td.duration_type = dp.duration_type
ORDER BY fee DESC, td.history_id DESC;
