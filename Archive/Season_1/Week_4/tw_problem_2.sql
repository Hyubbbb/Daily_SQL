-- 고양이와 개는 몇 마리 있을까(programmers - GROUP BY)
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS count
FROM ANIMAL_INS
WHERE ANIMAL_TYPE = 'Cat' OR ANIMAL_TYPE = 'Dog'
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE -- 고양이가 먼저 조회되게 해야해서 정렬 추가해줘야 하는걸 놓침
