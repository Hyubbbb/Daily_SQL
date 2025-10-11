-- https://school.programmers.co.kr/learn/courses/30/lessons/299305
SELECT 
    e1.id,
    COUNT(e2.id) AS child_count
FROM ecoli_data AS e1
    LEFT JOIN ecoli_data AS e2
        ON e1.id = e2.parent_id
GROUP BY e1.id
ORDER BY e1.id ASC;