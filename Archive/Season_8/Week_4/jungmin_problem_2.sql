-- programmers / IS NULL : 업그레이드 할 수 없는 아이템 구하기 (Level 3)
SELECT
    i.item_id,
    i.item_name,
    i.rarity
FROM item_info AS i
    LEFT JOIN item_tree AS t
    ON t.parent_item_id = i.item_id
WHERE
    t.item_id IS NULL
ORDER BY
    i.item_id DESC;
