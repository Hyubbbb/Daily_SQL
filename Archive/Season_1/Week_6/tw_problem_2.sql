-- 오프라인/온라인 판매 데이터 통합하기(programmers)

-- 통합하기 -> 문제 읽을 때부터 UNION 사용 예상

-- Unknown column 'USER_ID' in 'field list' -> 자꾸 이 에러가 떠서 
-- OFFLINE 테이블에는 USER_ID가 없는 거였다. 문제 제대로 안읽고 위 아래 똑같은 형식으로 UNION하려다가 그만
-- 예시 정답에는 NULL값이 그대로 포함되는 걸 보아, 복잡하게 제외해줄 필요도 없고 OFFLINE_SALE테이블에서 해당 컬럼을 NULL처리를 해줌으로써, 해결

SELECT DATE_FORMAT(SALES_DATE,'%Y-%m-%d') AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'

UNION ALL

SELECT DATE_FORMAT(SALES_DATE,'%Y-%m-%d') AS SALES_DATE, PRODUCT_ID, NULL, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'

ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;
