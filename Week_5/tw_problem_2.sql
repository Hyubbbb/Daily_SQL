-- 최솟값 구하기(programmers)
-- problem_1의 최솟값 버전임;; 어쩌다보니

SELECT DATETIME AS "시간"
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS)
