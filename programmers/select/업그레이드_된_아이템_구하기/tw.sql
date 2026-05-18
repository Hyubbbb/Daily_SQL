SELECT
    item_tree.item_id,
    item_info.item_name,
    item_info.rarity
FROM item_tree
JOIN item_info
    ON item_tree.item_id = item_info.item_id
JOIN rare_items
    ON item_tree.parent_item_id = rare_items.item_id
ORDER BY
    item_tree.item_id DESC 
