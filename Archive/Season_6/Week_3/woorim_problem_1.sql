-- https://school.programmers.co.kr/learn/courses/30/lessons/133025
SELECT f.flavor
FROM first_half f
    JOIN icecream_info info ON f.flavor = info.flavor
WHERE f.total_order > 3000
    AND info.ingredient_type = 'fruit_based'
ORDER BY f.total_order DESC;
