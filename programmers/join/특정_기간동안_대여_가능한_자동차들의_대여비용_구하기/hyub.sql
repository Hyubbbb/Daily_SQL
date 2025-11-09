WITH impossible_rental AS (
    SELECT DISTINCT
        car_id
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND NOT ((end_date < '2022-11-01') OR (start_date > '2022-11-30'))
)
SELECT
    crcc.car_id,
    crcc.car_type,
    ROUND(crcc.daily_fee * 30 * (1 - crcdp.discount_rate/100), 0) AS fee
FROM car_rental_company_car AS crcc
    JOIN car_rental_company_discount_plan AS crcdp
        ON crcc.car_type = crcdp.car_type
            AND crcdp.duration_type = '30일 이상'
WHERE 1=1
    AND crcc.car_type IN ('세단', 'SUV')
    AND crcc.car_id NOT IN (SELECT car_id FROM impossible_rental) -- 해당 기간 대여 가능 차량 필터링
HAVING fee BETWEEN 500000 AND 1999999
ORDER BY 
    fee DESC,
    car_type,
    car_id DESC