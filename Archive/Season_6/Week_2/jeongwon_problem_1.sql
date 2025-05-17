-- 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/157340

SELECT
    CAR_ID,
    CASE
        WHEN SUM(CASE WHEN START_DATE <= DATE '2022-10-16' AND END_DATE >= DATE '2022-10-16' 
                 THEN 1 ELSE 0 END) > 0
        THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;
