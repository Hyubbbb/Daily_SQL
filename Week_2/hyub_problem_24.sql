-- # 부모의 형질을 모두 보유한 대장균의 ID(ID), 대장균의 형질(GENOTYPE), 부모 대장균의 형질(PARENT_GENOTYPE)을 출력
--     # 결과는 ID에 대해 오름차순 정렬
    
SELECT 
    a.ID AS ID,
    a.GENOTYPE AS GENOTYPE,
    b.GENOTYPE AS PARENT_GENOTYPE
    
FROM ECOLI_DATA a
    JOIN ECOLI_DATA b on a.PARENT_ID = b.ID
WHERE a.GENOTYPE & b.GENOTYPE = b.GENOTYPE
ORDER BY ID
