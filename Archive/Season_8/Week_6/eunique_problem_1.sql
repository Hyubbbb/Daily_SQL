Programmers > SELECT > 인기있는 아이스크림 
SELECT
    f.flavor
FROM first_half AS f 
ORDER BY f.total_order DESC, f.shipment_id ASC;
