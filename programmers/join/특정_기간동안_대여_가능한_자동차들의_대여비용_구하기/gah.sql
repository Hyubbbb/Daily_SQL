WITH car_available AS (
    SELECT
        c.car_id,
        c.car_type,
        c.daily_fee
    FROM car_rental_company_car AS c
        LEFT JOIN car_rental_company_rental_history AS h -- 대여 기간 겹치는 차량
            ON 1=1
                AND c.car_id = h.car_id
                AND h.start_date <= '2022-11-30'
                AND h.end_date >= '2022-11-01'
    WHERE 1=1
        AND c.car_type IN ('세단', 'SUV')
        AND h.history_id IS NULL
), -- 대여 가능 & 세단+SUV
car_30_discount AS (
    SELECT
        car_type,
        discount_rate
    FROM
        car_rental_company_discount_plan
    WHERE 1=1
        AND duration_type = '30일 이상'
)

SELECT
    a.car_id,
    a.car_type,
    FLOOR(a.daily_fee * 30 * (100 - d.discount_rate) / 100) AS fee
FROM car_available AS a
    JOIN car_30_discount AS d
        ON a.car_type = d.car_type
WHERE 1=1
    AND FLOOR(a.daily_fee * 30 * (100 - d.discount_rate) / 100) >= 500000
    AND FLOOR(a.daily_fee * 30 * (100 - d.discount_rate) / 100) <= 2000000
ORDER BY 1=1,
    fee DESC,
    a.car_type ASC,
    a.car_id DESC;
