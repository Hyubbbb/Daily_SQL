-- [PROGRAMMERS] GROUP BY > 자동자 대여 기록에서 대여중 / 대여 가능 여부 구분하기

-- 첫 번째 쿼리 (오답)
-- 한 차량에 대해 여러 번의 대여 기록이 있을 것이라는 생각을 못함
SELECT CAR_ID,
       CASE WHEN START_DATE > '2022-10-16'
                 OR END_DATE <= '2022-10-16' THEN '대여 가능'
            ELSE '대여중'
       END AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
ORDER BY CAR_ID DESC;

-- 최종 쿼리 (정답)
-- 중첩 CASE 구문을 사용하여 한 차량에 대해 여러 번의 대여 기록을 모두 고려
SELECT CAR_ID,
       CASE WHEN MAX(CASE WHEN "2022-10-16" BETWEEN START_DATE AND END_DATE THEN 1
                 ELSE 0 END) = 1 THEN '대여중'
            ELSE '대여 가능'
       END AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;
