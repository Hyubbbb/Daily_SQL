SELECT
    car_id,
    MAX(CASE
        WHEN start_date > '2022-10-16'
            OR end_date < '2022-10-16'
            THEN '대여 가능'
        ELSE '대여중'
    END) AS availability
FROM car_rental_company_rental_history
GROUP BY car_id
ORDER BY car_id DESC;
