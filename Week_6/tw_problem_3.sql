-- 오랜 기간 보호한 동물(1) (programmers)
-- JOIN 없이 NOT IN으로 풀이됨
-- 상위 3개 추출: 일단 기준 컬럼에 맞게 정렬 후, LIMIT 구문으로 상위 N개 추출을 지정해주면 됨
SELECT NAME, DATETIME
FROM ANIMAL_INS
WHERE ANIMAL_ID NOT IN(
SELECT ANIMAL_ID
FROM ANIMAL_OUTS
)
ORDER BY DATETIME
LIMIT 3
