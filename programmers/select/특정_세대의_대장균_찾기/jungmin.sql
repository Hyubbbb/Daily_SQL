-- 특정 세대의 대장균 찾기 (박정민)
SELECT e1.id
FROM ecoli_data AS e1
    LEFT JOIN ecoli_data AS e2
        ON e1.parent_id = e2.id
    LEFT JOIN ecoli_data AS e3
        ON e2.parent_id = e3.id
WHERE 1=1
    AND e3.id IS NOT NULL
    AND e3.parent_id IS NULL
ORDER BY e1.id ASC;
