-- 자동차 종류 별 특징 옵션이 포함된 자동차 수 구하기
SELECT car_type, count(car_id) as cars
FROM car_rental_company_car
WHERE options regexp ('가죽시트|열선시트|통풍시트')
group by car_type
order by car_type asc