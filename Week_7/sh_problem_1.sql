-- 과일로 만든 아이스크림 고르기
SELECT first_half.flavor as flavor
FROM first_half, icecream_info
WHERE first_half.flavor=icecream_info.flavor and total_order>3000 and ingredient_type="fruit_based"
ORDER BY total_order desc