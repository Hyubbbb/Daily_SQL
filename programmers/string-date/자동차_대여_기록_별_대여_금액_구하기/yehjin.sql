WITH truck AS (
    SELECT 
        crh.history_id,
        cc.daily_fee,
        cc.car_type,
        DATEDIFF(crh.end_date, crh.start_date) + 1 AS period,
        CASE
            WHEN DATEDIFF(crh.end_date, crh.start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(crh.end_date, crh.start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(crh.end_date, crh.start_date) + 1 >= 7 THEN '7일 이상'
            ELSE NULL
        END AS duration_type
    FROM car_rental_company_rental_history AS crh
        JOIN car_rental_company_car AS cc
        ON crh.car_id = cc.car_id
    WHERE 1=1
        AND cc.car_type = '트럭'
)

SELECT
    t.history_id,
    ROUND(t.daily_fee * t.period * (100 - IFNULL(cdp.discount_rate,0)) / 100) AS fee
FROM truck AS t
    LEFT JOIN car_rental_company_discount_plan AS cdp
        ON t.car_type = cdp.car_type
            AND t.duration_type = cdp.duration_type
ORDER BY fee DESC, history_id DESC;
