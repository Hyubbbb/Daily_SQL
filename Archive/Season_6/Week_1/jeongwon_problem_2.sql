-- 업그레이드 할 수 없는 아이템 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/273712

SELECT 
    I.ITEM_ID,
    I.ITEM_NAME,
    I.RARITY
FROM ITEM_INFO I
WHERE 
    I.ITEM_ID NOT IN (
        SELECT DISTINCT PARENT_ITEM_ID
        FROM ITEM_TREE
        WHERE PARENT_ITEM_ID IS NOT NULL
    )
ORDER BY I.ITEM_ID DESC;
