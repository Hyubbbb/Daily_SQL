WITH car_fee AS (
    SELECT
        c.car_id,
        c.car_type,
        ROUND(c.daily_fee * 30 * (1 - dp.discount_rate / 100.0)) AS fee
    FROM car_rental_company_car AS c
        JOIN car_rental_company_discount_plan AS dp
            ON dp.car_type       = c.car_type
            AND dp.duration_type = '30일 이상'
    WHERE 1=1
        AND c.car_type IN ('세단', 'SUV')
        AND NOT EXISTS (
            SELECT
                1
            FROM car_rental_company_rental_history AS rh
            WHERE 1=1
                AND rh.car_id     = c.car_id
                AND rh.start_date <= '2022-11-30'
                AND rh.end_date   >= '2022-11-01'
        )
)
SELECT
    car_id,
    car_type,
    fee
FROM car_fee
WHERE 1=1
    AND fee BETWEEN 500000 AND 1999999
ORDER BY
    fee DESC,
    car_type ASC,
    car_id DESC;
