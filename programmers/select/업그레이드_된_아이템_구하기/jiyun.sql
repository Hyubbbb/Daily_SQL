SELECT
    child.item_id,
    child.item_name,
    child.rarity
FROM item_info AS parent
    INNER JOIN item_tree AS tree
        ON parent.item_id = tree.parent_item_id
    INNER JOIN item_info AS child
        ON tree.item_id = child.item_id
WHERE 1=1
    AND parent.rarity = 'RARE' -- 부모 아이템의 희귀도 'RARE'
ORDER BY child.item_id DESC
