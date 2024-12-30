-- 업그레이드 된 아이템 구하기
select b.item_id, c.item_name, c.rarity
from item_info as a left join item_tree as b on a.item_id=b.parent_item_id left join item_info as c on b.item_id=c.item_id
where a.rarity="rare" and b.parent_item_id is not null
order by b.item_id desc