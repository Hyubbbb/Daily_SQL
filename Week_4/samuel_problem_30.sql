-- https://school.programmers.co.kr/learn/courses/30/lessons/301647
-- Use two identical tables to count child-parent relations

SELECT EC.ID, EC.GENOTYPE, E.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA EC
INNER JOIN ECOLI_DATA E ON EC.PARENT_ID = E.ID
WHERE (EC.GENOTYPE & E.GENOTYPE) = E.GENOTYPE
ORDER BY child.ID ASC;