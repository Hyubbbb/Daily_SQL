WITH rental_period AS (
    SELECT 
        crcc.car_type,
        crcc.daily_fee,
        crcrh.history_id,
        crcrh.car_id, 
        DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 AS total_day,
        CASE
            WHEN DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 >= 7 THEN '7일 이상'
            ELSE NULL
        END AS duration_type
    FROM car_rental_company_rental_history AS crcrh
        JOIN car_rental_company_car AS crcc
            ON crcrh.car_id = crcc.car_id
),

discount_ratio AS (
    SELECT
        crcdp.plan_id,
        crcdp.car_type,
        crcdp.duration_type,
        (100 - REPLACE(discount_rate, '%', '')) * 0.01 AS discount_r
    FROM car_rental_company_discount_plan AS crcdp
)

SELECT 
    rp.history_id,
    FLOOR(rp.daily_fee * rp.total_day * IFNULL(dr.discount_r, 1)) AS fee
FROM rental_period AS rp
    LEFT JOIN discount_ratio AS dr
        ON rp.car_type = dr.car_type
            AND rp.duration_type = dr.duration_type
WHERE rp.car_type = '트럭'
ORDER BY fee DESC, history_id DESC;
