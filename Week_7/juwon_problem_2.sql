-- 자동차 대여 기록에서 장기/단기 대여 구분하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151138

SELECT
    HISTORY_ID,  -- 대여 기록 ID
    CAR_ID,      -- 자동차 ID
    TO_CHAR(START_DATE, 'YYYY-MM-DD') AS START_DATE,  -- 대여 시작일 (포맷: YYYY-MM-DD)
    TO_CHAR(END_DATE, 'YYYY-MM-DD') AS END_DATE,      -- 대여 종료일 (포맷: YYYY-MM-DD)
    CASE
        WHEN END_DATE - START_DATE >= 30 THEN '장기 대여'
        ELSE '단기 대여'
    END AS RENT_TYPE  -- 대여 기간에 따른 구분 (30일 이상: 장기 대여, 그 외: 단기 대여)
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
    START_DATE BETWEEN TO_DATE('2022-09-01', 'YYYY-MM-DD') 
                 AND TO_DATE('2022-09-30', 'YYYY-MM-DD')  -- 2022년 9월 대여 기록 필터링
ORDER BY
    HISTORY_ID DESC;  -- 대여 기록 ID 기준 내림차순 정렬
