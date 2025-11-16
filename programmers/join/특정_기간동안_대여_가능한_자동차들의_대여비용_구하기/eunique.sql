-- 코드를 입력하세요-- 
WITH can_rental AS (
    SELECT
        c1.car_id,
        c1.car_type,     
        ROUND(c1.daily_fee * 30 * (1 - c2.discount_rate/100)) AS fee
    FROM car_rental_company_car AS c1
        LEFT JOIN car_rental_company_discount_plan AS c2
            ON c1.car_type = c2.car_type
    WHERE 1=1
        AND c1.car_type IN ('세단', 'SUV')
        AND NOT EXISTS (
            SELECT 1
            FROM car_rental_company_rental_history AS c3
            WHERE c1.car_id = c3.car_id
              AND (c3.start_date <= '2022-11-30' AND c3.end_date >= '2022-11-01')
        )
        AND c2.duration_type = '30일 이상'
    GROUP BY c1.car_id
)


SELECT
   car_id,
   car_type,
   fee
FROM can_rental
WHERE 1=1
    AND fee >= 500000
    AND fee < 2000000
ORDER BY 
    fee DESC,
    car_type ASC,
    car_id DESC
