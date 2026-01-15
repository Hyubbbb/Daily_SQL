-- https://school.programmers.co.kr/learn/courses/30/lessons/59041
SELECT
    name,
    COUNT(name) AS count
FROM animal_ins
WHERE 1=1
    AND name IS NOT NULL
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY name;
