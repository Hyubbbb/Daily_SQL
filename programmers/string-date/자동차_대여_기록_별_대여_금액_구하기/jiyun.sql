WITH history_duration AS ( -- 대여 기간 & 타입
    SELECT
        crcrh.history_id,
        crcc.car_type,
        crcc.daily_fee,
        DATEDIFF(end_date, start_date) + 1 AS duration,
        CASE
            WHEN DATEDIFF(end_date, start_date) + 1 BETWEEN 7 AND 29 THEN '7일 이상'
            WHEN DATEDIFF(end_date, start_date) + 1 BETWEEN 30 AND 89 THEN '30일 이상'
            WHEN DATEDIFF(end_date, start_date) + 1 >= 90 THEN '90일 이상'
            ELSE NULL
        END AS duration_type 
    FROM car_rental_company_rental_history AS crcrh
        INNER JOIN car_rental_company_car AS crcc
            ON crcrh.car_id = crcc.car_id
)

SELECT
    hd.history_id,
    ROUND(hd.duration * hd.daily_fee * (1-IFNULL(discount_rate, 0)/100)) AS fee
FROM history_duration AS hd
    LEFT JOIN car_rental_company_discount_plan As crcdp
        ON hd.car_type = crcdp.car_type 
            AND hd.duration_type = crcdp.duration_type
WHERE hd.car_type = '트럭'
ORDER BY fee DESC, hd.history_id DESC
