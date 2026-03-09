WITH truck_info AS (
    SELECT
        rh.history_id,
        cc.daily_fee,
        DATEDIFF(rh.end_date, rh.start_date) + 1 AS date_diff,
        CASE
            WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 7 THEN '7일 이상'
        END AS duration_type
    FROM car_rental_company_rental_history AS rh
        JOIN car_rental_company_car AS cc
            ON rh.car_id = cc.car_id
    WHERE 1=1   
        AND cc.car_type = '트럭'
),

truck_discount AS(
    SELECT 
        duration_type,
        discount_rate
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE car_type = '트럭'
)

SELECT
    ti.history_id,
    CASE
        WHEN discount_rate IS NULL THEN FLOOR(daily_fee * date_diff)
        ELSE FLOOR(daily_fee * date_diff * (1 - discount_rate * 0.01))
    END AS fee    
FROM truck_info AS ti
    LEFT JOIN truck_discount AS td
        ON ti.duration_type = td.duration_type
ORDER BY fee DESC, ti.history_id DESC;
