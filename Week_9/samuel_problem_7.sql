-- https://school.programmers.co.kr/learn/courses/30/lessons/273712
-- Use LEFT JOIN and set PARENT_ITEM_ID to NULL to indicate items are not in PARENT_ITEM_ID column.

SELECT
    II.ITEM_ID AS ITEM_ID,
    II.ITEM_NAME AS ITEM_NAME,
    II.RARITY AS RARITY

FROM ITEM_INFO AS II
LEFT JOIN ITEM_TREE AS IT
ON II.ITEM_ID = IT.PARENT_ITEM_ID
WHERE IT.PARENT_ITEM_ID IS NULL
ORDER BY II.ITEM_ID DESC;