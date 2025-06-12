-- https://school.programmers.co.kr/learn/courses/30/lessons/131114
SELECT warehouse_id, warehouse_name, address, COALESCE(freezer_yn,'N')
FROM food_warehouse
WHERE address LIKE '%경기도%'
ORDER BY warehouse_id
