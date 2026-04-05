SELECT
    h.history_id,
    ROUND(
        c.daily_fee
        * (DATEDIFF(h.end_date, h.start_date) + 1)
        * (100 - IFNULL(p.discount_rate, 0)) / 100
    ) AS fee
FROM car_rental_company_car AS c
JOIN car_rental_company_rental_history AS h
    ON c.car_id = h.car_id
LEFT JOIN car_rental_company_discount_plan AS p
    ON c.car_type = p.car_type
   AND p.duration_type = CASE
        WHEN DATEDIFF(h.end_date, h.start_date) + 1 < 7 THEN '7일 미만'
        WHEN DATEDIFF(h.end_date, h.start_date) + 1 < 30 THEN '7일 이상'
        WHEN DATEDIFF(h.end_date, h.start_date) + 1 < 90 THEN '30일 이상'
        ELSE '90일 이상'
   END
WHERE c.car_type = '트럭'
ORDER BY fee DESC, h.history_id DESC;
