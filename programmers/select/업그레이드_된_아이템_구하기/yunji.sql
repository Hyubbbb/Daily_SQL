WITH rare_item AS (
    SELECT item_id
    FROM item_info
    WHERE 1=1
        AND rarity = 'RARE'
)

SELECT
    ii.item_id,
    ii.item_name,
    ii.rarity
FROM item_info AS ii
    INNER JOIN item_tree AS it
        ON ii.item_id = it.item_id
    INNER JOIN rare_item AS ri
        ON it.parent_item_id = ri.item_id
ORDER BY ii.item_id DESC;
