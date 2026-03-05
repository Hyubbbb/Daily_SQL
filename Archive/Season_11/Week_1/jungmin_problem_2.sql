# -- https://school.programmers.co.kr/learn/courses/30/lessons/273711
SELECT 
    info.item_id,
    info.item_name,
    info.rarity
FROM item_info AS ii
    JOIN item_tree AS it
        ON ii.item_id = it.parent_item_id
    JOIN item_info AS info
        ON it.item_id = info.item_id
WHERE 1=1
    AND ii.rarity = 'RARE'
ORDER BY info.item_id DESC;
