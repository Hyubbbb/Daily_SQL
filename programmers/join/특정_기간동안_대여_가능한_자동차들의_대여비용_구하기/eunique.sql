-- 코드를 입력하세요-- 
SELECT
    c.car_id,
    c.car_type,
    FLOOR(c.daily_fee * 30 * (1 - d.discount_rate / 100)) AS fee
FROM car_rental_company_car c
    JOIN car_rental_company_discount_plan d 
        ON c.car_type = d.car_type
        AND d.duration_type = '30일 이상'
WHERE 1=1
  AND c.car_type IN ('세단', 'SUV')
  AND c.car_id NOT IN (
        SELECT 
        h.car_id
        FROM car_rental_company_rental_history h
        WHERE NOT (h.end_Date < '2022-11-01' OR h.start_date > '2022-11-30')
    )
  AND FLOOR(c.daily_fee * 30 * (1 - d.discount_rate / 100)) BETWEEN 500000 AND 1999999
ORDER BY
    fee DESC,
    c.car_type ASC,
    c.car_id DESC;
