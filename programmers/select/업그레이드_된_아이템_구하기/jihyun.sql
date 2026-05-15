WITH tree AS (
    SELECT tree.item_id,
            info.item_name,
            tree.parent_item_id,
            info.rarity
    FROM item_tree AS tree
    JOIN item_info AS info
        ON tree.item_id = info.item_id
)
        
SELECT tree.item_id,
        tree.item_name,
        tree.rarity
FROM item_info AS info
JOIN tree
    ON info.item_id = tree.parent_item_id
WHERE 1=1
    AND info.rarity = 'RARE'
ORDER BY tree.item_id DESC
