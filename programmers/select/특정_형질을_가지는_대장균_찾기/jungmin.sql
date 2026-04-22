SELECT COUNT(*) AS count
FROM ecoli_data
WHERE 1=1
    AND (genotype & 2 = 0)
    AND ((genotype & 1 > 0) OR (genotype & 4 > 0))
