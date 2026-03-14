SELECT 
    rh.history_id,
    TRUNCATE(
        (DATEDIFF(rh.end_date, rh.start_date) + 1) * c.daily_fee * (1 - IFNULL(dp.discount_rate, 0) / 100), 0) AS fee
FROM car_rental_company_rental_history AS rh
    JOIN car_rental_company_car AS c
        ON rh.car_id = c.car_id
    LEFT JOIN car_rental_company_discount_plan as dp
        ON c.car_type = dp.car_type
            AND dp.duration_type = (CASE
                                        WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 90 THEN '90일 이상'
                                        WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 30 THEN '30일 이상'
                                        WHEN DATEDIFF(rh.end_date, rh.start_date) + 1 >= 7 THEN '7일 이상'
                                    END)
WHERE 1=1
    AND c.car_type = '트럭'
ORDER BY fee DESC, history_id DESC