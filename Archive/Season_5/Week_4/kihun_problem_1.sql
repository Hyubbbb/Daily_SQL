-- https://school.programmers.co.kr/learn/courses/30/lessons/151137
SELECT
    car_type,
    count(*) as CARS
from car_rental_company_car
    where options like '%통풍시트%'
    or options like '%열선시트%'
    or options like '%가죽시트%'
group by car_type
order by car_type
;
    