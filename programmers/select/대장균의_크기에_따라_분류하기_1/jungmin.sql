-- 대장균의 크기에 따라 분류하기1 (박정민)
SELECT
    id,
    CASE
        WHEN size_of_colony <= 100 THEN 'LOW'
        WHEN size_of_colony BETWEEN 101 AND 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS size
FROM ecoli_data
ORDER BY id ASC

-- CASE WHEN에서 LOW와 HIGH 조건
-- SELECT
--     id,
--     CASE
--         WHEN size_of_colony <= 100 THEN 'LOW'
--         WHEN size_of_colony > 1000 THEN 'HIGH'
--         ELSE 'MEDIUM'
--     END AS size
-- FROM ecoli_data
-- ORDER BY id ASC
