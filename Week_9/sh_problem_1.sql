-- 부모의 형질을 모두 가지는 대장균 찾기 찾기
SELECT a.id, a.genotype, b.genotype as parent_genotype
FROM ecoli_data as a, ecoli_data as b
WHERE a.parent_id=b.id and a.genotype & b.genotype = b.genotype
ORDER BY a.id asc