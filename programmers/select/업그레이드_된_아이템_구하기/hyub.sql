SELECT
    child.item_id,
    child.item_name,
    child.rarity
FROM item_info AS child
    JOIN item_tree AS tree -- 테이블 ITEM_TREE를 통해 각 아이템의 부모를 JOIN
        ON child.item_id = tree.item_id
    JOIN item_info AS parent -- 부모의 RARITY 파악을 위해 INFO를 부모 기준으로 JOIN
        ON tree.parent_item_id = parent.item_id
WHERE 1=1
    AND parent.rarity = 'RARE'
ORDER BY child.item_id DESC;