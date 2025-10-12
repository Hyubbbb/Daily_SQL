SELECT 
    e1.id,
    COUNT(e2.id) AS child_count # NULL은 0으로 COUNT됨
FROM ecoli_data e1
    LEFT JOIN ecoli_data e2 # LEFT JOIN으로 자식이 없는 id(NULL)도 살리기
        ON e1.id = e2.parent_id
GROUP BY e1.id
ORDER BY e1.id
