-- programmers(중복 제거하기)
SELECT COUNT(DISTINCT name) as 'count'
FROM animal_ins
WHERE name IS NOT null
