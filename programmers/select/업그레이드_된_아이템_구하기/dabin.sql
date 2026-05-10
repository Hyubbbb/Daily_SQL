-- 업그레이드 된 아이템 구하기 (윤다빈)
WITH rare_items AS (
    SELECT 
        item_id
    FROM 
        item_info
    WHERE 1=1
      AND rarity = 'RARE'
)

SELECT 
    info.item_id, 
    info.item_name, 
    info.rarity
FROM 
    item_info AS info 
JOIN 
    item_tree AS tree
    ON info.item_id = tree.item_id
JOIN 
    rare_items AS rare
    ON tree.parent_item_id = rare.item_id
WHERE 1=1
ORDER BY 
    info.item_id DESC;
