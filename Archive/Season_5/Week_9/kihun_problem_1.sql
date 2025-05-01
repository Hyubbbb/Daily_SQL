-- https://school.programmers.co.kr/learn/courses/30/lessons/293261
SELECT
    i.ID,
    n.FISH_NAME,
    i.LENGTH
FROM FISH_NAME_INFO n 
    INNER JOIN FISH_INFO i
        ON n.FISH_TYPE = i.FISH_TYPE
WHERE
    (i.FISH_TYPE, i.LENGTH) 
    IN (
        SELECT
            FISH_TYPE,
            MAX(LENGTH) AS LENGTH
        FROM FISH_INFO
        GROUP BY FISH_TYPE
        )
ORDER BY
    i.ID ASC;