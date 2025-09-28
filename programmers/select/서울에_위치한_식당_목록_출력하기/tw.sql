-- 코드를 입력하세요
-- 1. 서울에 위치한 식당들만 필터링
-- 2. JOIN 해서 집계 결과 출력

WITH SEOUL_REST AS (
    SELECT
        REST_ID,
        REST_NAME,
        FOOD_TYPE,
        FAVORITES,
        ADDRESS
    FROM REST_INFO
    WHERE ADDRESS LIKE '서울%'
)

SELECT
    s.REST_ID,
    s.REST_NAME,
    s.FOOD_TYPE,
    s.FAVORITES,
    s.ADDRESS,
    ROUND(AVG(r.REVIEW_SCORE), 2) AS 'SCORE'
FROM SEOUL_REST s
  JOIN REST_REVIEW r
    USING(REST_ID)
GROUP BY s.REST_ID
ORDER BY 6 DESC, 4 DESC
