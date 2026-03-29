# --https://school.programmers.co.kr/learn/courses/30/lessons/273710
SELECT
    it.item_id,
    ii.item_name
FROM item_tree it
JOIN item_info ii
  ON it.item_id = ii.item_id
WHERE 1 = 1
  AND it.parent_item_id IS NULL
ORDER BY
    it.item_id;