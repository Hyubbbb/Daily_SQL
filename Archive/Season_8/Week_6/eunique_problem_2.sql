Programmers > SELECT > 과일로 만든 아이스크림 고르기 
-- 코드를 입력하세요
SELECT
    f.flavor
FROM first_half AS f 
    JOIN icecream_info AS i 
    ON f.flavor = i.flavor 
WHERE 1=1
    AND f.total_order > 3000
    AND i.ingredient_type = 'fruit_based'
ORDER BY f.total_order DESC;
--
# CASE WHEN → 조건에 따라 “값을 바꾸거나 새 컬럼 생성”
# WHERE → 조건에 따라 “행을 필터링”
