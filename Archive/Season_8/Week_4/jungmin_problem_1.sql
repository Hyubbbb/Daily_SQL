--- programmers / IS NULL : Root 아이템 구하기 (Level 2)
SELECT
    info.item_id,
    info.item_name
FROM item_info AS info
    LEFT JOIN item_tree AS tree
        ON info.item_id = tree.item_id
WHERE 1=1
    AND tree.parent_item_id IS NULL
ORDER BY info.item_id ASC;
