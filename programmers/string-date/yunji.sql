SELECT 
    c.car_id
FROM car_rental_company_rental_history AS h
    INNER JOIN car_rental_company_car AS c
        ON h.car_id = c.car_id
WHERE 1=1
    AND c.car_type = '세단'
    AND MONTH(h.start_date) = 10
GROUP BY c.car_id
ORDER BY c.car_id DESC;
