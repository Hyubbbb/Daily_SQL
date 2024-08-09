SELECT A.ID, A.GENOTYPE, B.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS A
LEFT JOIN ECOLI_DATA AS B
ON A.PARENT_ID = B.ID
WHERE A.GENOTYPE & B.GENOTYPE >= B.GENOTYPE
ORDER BY A.ID;