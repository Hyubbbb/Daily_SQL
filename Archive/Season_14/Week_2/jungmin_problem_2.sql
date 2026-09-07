-- https://datalemur.com/questions/tesla-unfinished-parts
SELECT
    part,
    assembly_step
FROM parts_assembly
WHERE 1=1
    AND finish_date IS NULL;
