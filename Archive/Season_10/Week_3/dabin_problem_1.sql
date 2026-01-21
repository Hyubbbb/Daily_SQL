-- 강원도에 위치한 생산공장 목록 출력하기 (윤다빈)
SELECT 
    f.factory_id,
    f.factory_name,
    f.address
FROM food_factory AS f
WHERE 1 = 1
  AND f.address LIKE '강원도%'
ORDER BY f.factory_id ASC;
