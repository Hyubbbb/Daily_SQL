SELECT
    h.history_id,
    FLOOR(
        c.daily_fee * (100 - IFNULL(d.discount_rate, 0)) / 100
        * (DATEDIFF(h.end_date, h.start_date) + 1)
    ) AS fee
FROM car_rental_company_rental_history AS h
LEFT JOIN car_rental_company_car AS c
    ON h.car_id = c.car_id
LEFT JOIN car_rental_company_discount_plan AS d
    ON c.car_type = d.car_type
    AND d.duration_type = CASE
        WHEN DATEDIFF(h.end_date, h.start_date) + 1 >= 90 THEN '90일 이상'
        WHEN DATEDIFF(h.end_date, h.start_date) + 1 >= 30 THEN '30일 이상'
        WHEN DATEDIFF(h.end_date, h.start_date) + 1 >= 7 THEN '7일 이상'
        ELSE NULL
    END
WHERE 1 = 1
    AND c.car_type = '트럭'
ORDER BY fee DESC, h.history_id DESC;
