-- 2번 형질이 보유하지 않으면서(AND) 
-- 1번이나 3번 형질을 보유(OR)

SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE (GENOTYPE & 2 = 0) 
  AND (GENOTYPE & 1 != 0 OR GENOTYPE & 4 != 0);

-- &연산자에 대해 익숙하지 않으면 돌아갈 수 밖에 없었던 문제
-- 비트 연산자 중 하나로, 두 숫자의 각 비트를 비교하여 둘 다 1인 경우에만 결과가 1이 되는 연산
-- 즉, 비교값의 비트에서 1, 2, 3, 4 각각의 2진수 비트에 1이 일치하는 경우 = 그 형질을 보유하고 있는 것을 판단,
-- 0일 경우엔 없는 것
