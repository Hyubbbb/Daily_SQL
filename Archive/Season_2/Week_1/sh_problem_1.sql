--특정형질을 가지는 대장균 구하기

SELECT count(ID) as count
FROM ecoli_data
WHERE genotype & 2 =0 
AND (genotype&1>=1 OR genotype&4>=1)