-- 동명 동물 수 찾기
SELECT name, count
FROM 
(SELECT name, count(animal_id) as count
FROM animal_ins
WHERE name is not null
GROUP BY name) as T
WHERE count>=2
ORDER BY name