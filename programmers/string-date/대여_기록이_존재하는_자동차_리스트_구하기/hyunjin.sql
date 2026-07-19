-- 코드를 입력하세요
SELECT 
    DISTINCT(c.car_id)
FROM car_rental_company_car AS c
    LEFT JOIN car_rental_company_rental_history AS h
        ON c.car_id = h.car_id
WHERE 1=1
    AND c.car_type = '세단'
    AND MONTH(h.start_date) = 10
ORDER BY c.car_id DESC
