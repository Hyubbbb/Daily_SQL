-- https://school.programmers.co.kr/learn/courses/30/lessons/298519
-- Having is used after GROUP BY to filter by an aggregate property.

SELECT
    COUNT(ID) AS FISH_COUNT,
    MAX(COALESCE(LENGTH,10)) AS MAX_LENGTH,
    FISH_TYPE
FROM FISH_INFO
GROUP BY FISH_TYPE
HAVING AVG(COALESCE(LENGTH, 10)) >= 33
ORDER BY FISH_TYPE ASC;