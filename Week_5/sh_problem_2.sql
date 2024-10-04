-- 자동차 대여 기록에서 장기/단기 대여 구분하기
SELECT history_id, car_id, DATE_FORMAT(start_date, '%Y-%m-%d') as start_date, DATE_FORMAT(end_date, '%Y-%m-%d') as end_date,if(datediff(end_date, start_date)>=29, "장기 대여","단기 대여") as rent_type
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE month(start_date)=9 and year(start_date)=2022
ORDER BY history_id desc
