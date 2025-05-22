-- https://school.programmers.co.kr/learn/courses/30/lessons/301650
SELECT ID
FROM ECOLI_DATA
WHERE PARENT_ID IN (
    -- 2세대 ID들
    SELECT ID
    FROM ECOLI_DATA  
    WHERE PARENT_ID IN (
        -- 1세대 ID들 (PARENT_ID가 NULL)
        SELECT ID
        FROM ECOLI_DATA
        WHERE PARENT_ID IS NULL
    )
)
ORDER BY ID;