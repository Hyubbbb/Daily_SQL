-- 동물 정보를 조회하며 이름이 NULL인 경우 'No name'으로 표시하는 쿼리
SELECT 
   ANIMAL_TYPE, 
   COALESCE(NAME, 'No name') AS NAME, 
   SEX_UPON_INTAKE
FROM 
   ANIMAL_INS
ORDER BY 
   ANIMAL_ID;