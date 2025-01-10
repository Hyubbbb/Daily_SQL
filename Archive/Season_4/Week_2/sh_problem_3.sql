-- 이름에 el이 들어가는 동물 찾기
SELECT animal_id, name
FROM animal_ins
WHERE upper(name) like "%EL%" and animal_type="Dog"
ORDER BY name