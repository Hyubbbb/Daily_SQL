-- # 아이템의 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템의 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력
--     # 아이템 ID를 기준으로 내림차순 정렬
    
-- # Solution 1: HYUB
-- # SELECT ITEM_ID, ITEM_NAME, RARITY
-- # FROM ITEM_INFO
-- # WHERE ITEM_ID in
-- #     (SELECT t.ITEM_ID
-- #     FROM ITEM_INFO i 
-- #     JOIN ITEM_TREE t on i.ITEM_ID = t.PARENT_ITEM_ID
-- #     WHERE RARITY = 'RARE')
-- # ORDER BY ITEM_ID DESC

-- # Solution 2: GPT
SELECT i.ITEM_ID, i.ITEM_NAME, i.RARITY
FROM ITEM_INFO i
JOIN ITEM_TREE t ON i.ITEM_ID = t.ITEM_ID
JOIN ITEM_INFO pi ON t.PARENT_ITEM_ID = pi.ITEM_ID
WHERE pi.RARITY = 'RARE'
ORDER BY i.ITEM_ID DESC
