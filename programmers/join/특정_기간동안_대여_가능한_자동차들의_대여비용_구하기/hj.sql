SELECT 
    c1.car_id,
    c1.car_type,
    FLOOR(c1.daily_fee * 30 * (1 - COALESCE(c2.discount_rate, 0) / 100)) AS fee
FROM car_rental_company_car AS c1
    JOIN car_rental_company_discount_plan AS c2
        ON c1.car_type = c2.car_type
           AND c2.duration_type = '30일 이상'
    LEFT JOIN car_rental_company_rental_history AS c3
        ON c1.car_id = c3.car_id
           AND c3.start_date <= '2022-11-30'
           AND c3.end_date >= '2022-11-01'
WHERE 1=1
    AND c1.car_type IN ('SUV', '세단')
    AND c3.car_id IS NULL
    AND (c1.daily_fee * 30 * (1 - COALESCE(c2.discount_rate, 0) / 100)) BETWEEN 500000 AND 1999999
ORDER BY 
    fee DESC, 
    c1.car_type ASC, 
    c1.car_id DESC;
