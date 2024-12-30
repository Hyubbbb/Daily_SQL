-- 자동차 평균 대여 기간 구하기
SELECT car_id, average_duration
FROM (SELECT car_id, round(avg(diff),1) as average_duration
        FROM (SELECT DATEDIFF(end_date, start_date)+1 as diff, car_id
                FROM car_rental_company_rental_history) as T
        GROUP BY car_id) as S
WHERE average_duration>=7
order by average_duration desc, car_id desc