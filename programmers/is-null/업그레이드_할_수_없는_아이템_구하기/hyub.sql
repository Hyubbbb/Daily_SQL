SELECT
    ii.item_id,
    ii.item_name,
    ii.rarity
FROM item_info AS ii
    LEFT JOIN item_tree AS it
        ON ii.item_id = it.parent_item_id
WHERE 1=1
    AND it.parent_item_id IS NULL -- 강화 불가능한(아무도 나를 PARENT로 갖지 않는) ITEM만 필터링
ORDER BY ii.item_id DESC