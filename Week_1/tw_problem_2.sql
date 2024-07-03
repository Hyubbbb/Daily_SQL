-- 재구매가 일어난 상품과 회원 리스트 구하기(programmers)
-- GROUP BY 중복 사용 -> 그룹 칼럼이 여러 개인 경우 첫 번째 칼럼으로 먼저 그룹이 묶이고, 두 번째 칼럼으로 집계가 되고..순서대로 간단함
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) > 1
ORDER BY USER_ID ASC, PRODUCT_ID DESC;
