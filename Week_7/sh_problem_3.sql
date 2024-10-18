-- 인기있는 아이스크림
SELECT flavor
FROM first_half
ORDER BY total_order desc, shipment_id asc
