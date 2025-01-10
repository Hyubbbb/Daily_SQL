-- 중복 제거하기
SELECT count(name) as count
FROM 
(SELECT name
FROM animal_ins
WHERE name is not null
GROUP BY name) as T