-- 대장균의 크기에 따라 분류하기 2 (박정민)
SELECT
    id,
    CASE NTILE(4) OVER (ORDER BY size_of_colony DESC)
        WHEN 1 THEN 'CRITICAL'
        WHEN 2 THEN 'HIGH'
        WHEN 3 THEN 'MEDIUM'
        WHEN 4 THEN 'LOW'
    END AS colony_name
FROM
    ecoli_data
ORDER BY
    id;
