SELECT
    c.id,
    c.genotype,
    p.genotype AS parent_genotype
FROM ecoli_data AS c
    JOIN ecoli_data AS p
        ON c.parent_id = p.id
WHERE 1=1
    AND (p.genotype & c.genotype) = p.genotype
ORDER BY c.id