SELECT
    factory_id,
    factory_name,
    address
FROM food_factory
WHERE 1=1
    AND address LIKE '강원도%'
ORDER BY factory_id
