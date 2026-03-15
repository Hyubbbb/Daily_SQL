WITH rental_info AS (
    SELECT
        rh.history_id,
        c.car_type,
        c.daily_fee,
        DATEDIFF(rh.end_date, rh.start_date) + 1 AS rental_days,
        CASE
            WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 7 THEN '7일 이상'
            ELSE NULL
        END AS duration_type
    FROM car_rental_company_rental_history AS rh
        JOIN car_rental_company_car AS c
            ON rh.car_id=c.car_id
    WHERE 1=1
        AND c.car_type='트럭'
)
SELECT
    ri.history_id,
    FLOOR(
        ri.daily_fee
        * ri.rental_days
        * (1 - IFNULL(dp.discount_rate, 0) / 100)
    ) AS fee
FROM rental_info AS ri
    LEFT JOIN car_rental_company_discount_plan AS dp
        ON ri.car_type=dp.car_type
        AND ri.duration_type=dp.duration_type
ORDER BY fee DESC, ri.history_id DESC;
