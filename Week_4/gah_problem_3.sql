-- [PROGRAMMERS] SELECT > 업그레이드 된 아이템 구하기

SELECT t.ITEM_ID, i.ITEM_NAME, i.RARITY
FROM ITEM_TREE t LEFT JOIN ITEM_INFO i
  ON t.ITEM_ID = i.ITEM_ID
WHERE t.PARENT_ITEM_ID IN (SELECT DISTINCT(ITEM_ID)
                           FROM ITEM_INFO
                           WHERE RARITY = 'RARE')
ORDER BY ITEM_ID DESC;
