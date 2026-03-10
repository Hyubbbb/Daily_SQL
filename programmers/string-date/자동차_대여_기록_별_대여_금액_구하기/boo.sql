SELECT
    crcrh.history_id,
    FLOOR(
        crcc.daily_fee * (DATEDIFF(crcrh.end_date, crcrh.start_date) + 1) * (100 - IFNULL(crcdp.discount_rate, 0)) / 100
    ) AS fee
FROM car_rental_company_car AS crcc
    JOIN car_rental_company_rental_history AS crcrh
        ON crcc.car_id = crcrh.car_id
    LEFT JOIN car_rental_company_discount_plan AS crcdp
        ON crcc.car_type = crcdp.car_type
           AND (
               (crcdp.duration_type = '7일 이상'  AND DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 >= 7  AND DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 < 30)
             OR (crcdp.duration_type = '30일 이상' AND DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 >= 30 AND DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 < 90)
             OR (crcdp.duration_type = '90일 이상' AND DATEDIFF(crcrh.end_date, crcrh.start_date) + 1 >= 90)
           )
WHERE 1=1
    AND crcc.car_type = '트럭'
ORDER BY fee DESC, crcrh.history_id DESC;
