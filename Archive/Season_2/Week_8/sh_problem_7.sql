-- 경기도에 위치한 식품창고 출력하기
SELECT warehouse_id, warehouse_name, address, ifnull(freezer_yn, "N") as freezer_yn
FROM food_warehouse
WHERE address like '경기도%'