SELECT
    c.car_id,
    c.car_type,
    FLOOR(daily_fee * 30 * (100 - discount_rate) * 0.01) AS FEE
FROM car_rental_company_car AS c
    LEFT JOIN car_rental_company_rental_history AS r
        ON c.car_id = r.car_id
            AND r.start_date <= '20221130'
            AND r.end_date >= '20221101'
    JOIN car_rental_company_discount_plan AS d
        ON c.car_type = d.car_type
            AND d.duration_type = '30일 이상'
            AND c.car_type IN ('SUV', '세단')
WHERE 1=1
    AND r.car_id IS NULL
    AND FLOOR(daily_fee*30*(100-discount_rate)*0.01) >= 500000
    AND FLOOR(daily_fee*30*(100-discount_rate)*0.01) <2000000
ORDER BY 3 DESC, 2, 1 DESC;
