-- 경기도에 위치한 식품창고 목록 출력하기(programmers)
-- Level 1 인데도 IFNULL을 혼자 떠올리지 못함..앞으로 사용법 숙지
-- 사용법: IFNULL(컬럼명, '컬럼이 Null일 경우 대체할 데이터)

SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N')
FROM FOOD_WAREHOUSE
WHERE LEFT(ADDRESS, 3) = '경기도'
ORDER BY WAREHOUSE_ID
