-- https://school.programmers.co.kr/learn/courses/30/lessons/301646
-- CASE, BITWISE operator

SELECT COUNT(
    CASE 
    WHEN ((GENOTYPE & 1) = 1  OR (GENOTYPE & 4) = 4) AND (GENOTYPE & 2) != 2 
    THEN 1 
    END
    ) AS COUNT
FROM ECOLI_DATA;