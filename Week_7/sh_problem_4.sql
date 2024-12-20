-- 성분으로 구분한 아이스크림 총 주문량
SELECT ingredient_type, sum(total_order) as total_order
FROM first_half as a join icecream_info as b on a.flavor=b.flavor
group by ingredient_type
order by total_order asc