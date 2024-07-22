-- # 2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' 이라고 표시하고, 대여 중이지 않은 자동차인 경우 '대여 가능'을 표시하는 컬럼(컬럼명: AVAILABILITY)을 추가
-- # 자동차 ID와 AVAILABILITY 리스트를 출력
--     # 이때 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시
--     # 결과는 자동차 ID를 기준으로 내림차순 정렬

SELECT CAR_ID, IF(SUM(AVAILABILITY)>0, '대여중', '대여 가능') AS AVAILABILITY
FROM
    (SELECT CAR_ID, IF((START_DATE <= '2022-10-16') AND (END_DATE >= '2022-10-16')
             , 1, 0) AS AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY) as tmp
GROUP BY CAR_ID
ORDER BY CAR_ID DESC
