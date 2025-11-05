-- programmers (String, Date) : 이름에 el이 들어가는 동물 찾기 (LEVEL 2)
SELECT
    animal_id,
    name
FROM animal_ins
WHERE 1=1
    AND animal_type = 'Dog'
    AND name LIKE '%el%' 
ORDER BY name;
