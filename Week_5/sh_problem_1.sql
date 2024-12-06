-- 조건에 맞는 아이템들의 가격의 총합 구하기
select sum(price) as total_price 
from item_info
where rarity="legend"
