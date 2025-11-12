--- 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기 (박정민)
WITH already_rent AS(
    SELECT c1.car_id
    FROM car_rental_company_car AS c1
        LEFT JOIN car_rental_company_rental_history AS c2
            ON c1.car_id = c2.car_id
    WHERE 1=1
        AND c1.car_type IN ('세단', 'SUV')
        AND c2.start_date <= '2022-11-30'
        AND c2.end_date >= '2022-11-01'
), discount AS(
    SELECT *
    FROM car_rental_company_discount_plan
    WHERE 1=1
        AND duration_type = '30일 이상'
)

SELECT
    c.car_id,
    c.car_type,
    FLOOR(c.daily_fee * 30 * (1- (d.discount_rate / 100))) AS fee
FROM car_rental_company_car AS c
    LEFT JOIN discount AS d
        ON c.car_type = d.car_type
    LEFT JOIN already_rent AS a
        ON c.car_id = a.car_id
WHERE 1=1
    AND c.car_type IN ('세단', 'SUV')
    AND a.car_id IS NULL
    AND (c.daily_fee * 30 * (1- (d.discount_rate / 100))) >= 500000
    AND (c.daily_fee * 30 * (1- (d.discount_rate / 100))) < 2000000
ORDER BY fee DESC, car_id DESC;
    
