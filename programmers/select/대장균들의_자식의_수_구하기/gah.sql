SELECT
    pr.id,
    COUNT(ch.id) AS child_count
FROM ecoli_data AS pr
    LEFT JOIN ecoli_data AS ch
        ON pr.id = ch.parent_id
GROUP BY id
ORDER BY id;
