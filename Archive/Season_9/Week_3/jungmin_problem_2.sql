-- programmers (String, Date) : 자동차 평균 대여 기간 구하기 (LEVEL 2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/157342
SELECT
    car_id,
    ROUND(AVG(DATEDIFF(end_date, start_date) + 1),1) AS average_duration
FROM car_rental_company_rental_history
GROUP BY car_id
HAVING average_duration >= 7
ORDER BY average_duration DESC, car_id DESC;
