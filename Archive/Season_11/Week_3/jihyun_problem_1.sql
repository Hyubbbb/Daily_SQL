# --https://school.programmers.co.kr/learn/courses/30/lessons/133026
SELECT
    i.ingredient_type,
    SUM(f.total_order) AS total_order
FROM first_half AS f
JOIN icecream_info AS i
    ON f.flavor = i.flavor
WHERE 1 = 1
GROUP BY i.ingredient_type
ORDER BY total_order ASC;