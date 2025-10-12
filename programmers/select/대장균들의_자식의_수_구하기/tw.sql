-- id와 parent_id로 JOIN 조건을 걸고
-- GROUP BY 하기 전에 조회해보면, parent_id에 있는 id가 개수만큼 행이 JOIN됨
-- 그대로 COUNT해주면 끝

SELECT
    e1.id AS id,
    COUNT(e2.id) AS child_count
FROM ecoli_data e1
    LEFT JOIN ecoli_data e2
        ON e1.id = e2.parent_id
GROUP BY 1
ORDER BY 1
