-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/301646
-- 2번 형질이 없고 1번이나 3번 형질이 있는 대장균 개체 수 계산
SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE (GENOTYPE & 2) = 0 AND ((GENOTYPE & 1) > 0 OR (GENOTYPE & 4) > 0)