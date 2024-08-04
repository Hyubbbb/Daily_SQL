-- # Table 1: USER_INFO
-- # Table 2: ONLINE_SALE

-- # USER_INFO 테이블과 ONLINE_SALE 테이블에서 년, 월, 성별 별로 상품을 구매한 회원수를 집계
--     # 결과는 년, 월, 성별을 기준으로 오름차순 정렬
--     # 이때, 성별 정보가 없는 경우 결과에서 제외

SELECT YEAR(SALES_DATE) AS YEAR, 
       MONTH(SALES_DATE) AS MONTH, 
       GENDER, 
       COUNT(DISTINCT(s.USER_ID)) AS USERS
FROM ONLINE_SALE s
    JOIN USER_INFO u on s.USER_ID = u.USER_ID
WHERE GENDER IS NOT NULL
GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE), GENDER
ORDER BY YEAR(SALES_DATE), MONTH(SALES_DATE), GENDER
