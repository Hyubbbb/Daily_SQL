-- 인기있는 아이스크림 (윤다빈)
SELECT flavor
FROM first_half
ORDER BY total_order DESC,
         shipment_id;
