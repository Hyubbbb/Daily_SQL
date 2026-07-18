-- 10월에 대여를 시작한 기록이 있는 세단 자동차 리스트
SELECT
    DISTINCT car.car_id
FROM car_rental_company_car AS car
    INNER JOIN car_rental_company_rental_history AS hist
        ON car.car_id = hist.car_id
WHERE 1 = 1
    AND car.car_type = '세단'
    AND hist.start_date >= '2022-10-01'
    AND hist.start_date < '2022-11-01'
ORDER BY
    car.car_id DESC;
