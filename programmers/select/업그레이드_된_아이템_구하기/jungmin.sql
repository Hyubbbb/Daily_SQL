SELECT
    ii2.item_id,
    ii2.item_name,
    ii2.rarity
FROM item_info AS ii1
    JOIN item_tree AS it
        ON ii1.item_id = it.parent_item_id
    JOIN item_info AS ii2
        ON it.item_id = ii2.item_id
WHERE 1=1
    AND ii1.rarity = 'RARE'
ORDER BY ii2.item_id DESC;
