-- # FOOD_ORDER 테이블에서 2022년 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 조회
--     # 결과는 주문 ID를 기준으로 오름차순 정렬

SELECT ORDER_ID, PRODUCT_ID, DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE, 
    CASE
    WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
    WHEN OUT_DATE  > '2022-05-01' THEN '출고대기'
    WHEN OUT_DATE IS NULL THEN '출고미정'
    END AS 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID
