-- 고양이와 개는 몇 마리 있을까
SELECT animal_type, count(animal_id) as count
FROM animal_ins
WHERE animal_type in ("Cat", "Dog")
GROUP BY animal_type
ORDER BY animal_type asc