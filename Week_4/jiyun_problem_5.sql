-- 코드를 작성해주세요
WITH PARENT AS (
SELECT T.ITEM_ID, T.PARENT_ITEM_ID FROM ITEM_TREE T
    JOIN (SELECT ITEM_ID, RARITY FROM ITEM_INFO
            WHERE RARITY = 'RARE') I
    ON T.PARENT_ITEM_ID = I.ITEM_ID)
    
SELECT P.ITEM_ID, C.ITEM_NAME, C.RARITY FROM ITEM_INFO C
    JOIN PARENT P ON C.ITEM_ID = P.ITEM_ID
WHERE P.PARENT_ITEM_ID IS NOT NULL
ORDER BY ITEM_ID DESC;
