WITH rare_item AS (
    SELECT
        item_id
    FROM item_info
    WHERE 1=1
        AND rarity = 'RARE'
)

SELECT
    info.item_id,
    info.item_name,
    info.rarity
FROM item_info AS info
    INNER JOIN item_tree AS tree
        ON info.item_id = tree.item_id
    INNER JOIN rare_item AS rare
        ON tree.parent_item_id = rare.item_id
ORDER BY info.item_id DESC;