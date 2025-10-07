-- Final Query
SELECT 
    ed1.id,
    COUNT(ed2.id) AS child_count
FROM ecoli_data AS ed1 -- 부모 기준 테이블 (ed1.id는 '부모'의 id)
    LEFT JOIN ecoli_data AS ed2 -- 자식 기준 테이블 (ed2.id는 '자식'의 id)
        ON ed1.id = ed2.parent_id -- '나'를 부모로 갖는 행을 JOIN
GROUP BY ed1.id
ORDER BY ed1.id

-- Query 1: 더 간결하게 풀 수 있지 않을까?
-- WITH t_child_cnt AS (
--     SELECT
--         parent_id,
--         COUNT(*) AS tmp_child_count
--     FROM ecoli_data
--     WHERE 1=1 
--         AND parent_id IS NOT NULL
--     GROUP BY parent_id
-- )
-- SELECT 
--     ed.id AS id,
--     COALESCE(tcc.tmp_child_count, 0) AS child_count
-- FROM ecoli_data AS ed
--     LEFT JOIN t_child_cnt AS tcc
--         ON ed.id = tcc.parent_id
-- ORDER BY id
