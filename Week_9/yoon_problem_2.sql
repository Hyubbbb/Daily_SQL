SELECT
    A.ID, 
    COALESCE(B.COUNT, 0) AS CHILD_COUNT
FROM ECOLI_DATA AS A
    LEFT JOIN (
        SELECT PARENT_ID, COUNT(*) AS COUNT
        FROM ECOLI_DATA
        GROUP BY PARENT_ID
        HAVING PARENT_ID IS NOT NULL
    ) AS B
    ON A.ID = B.PARENT_ID
ORDER BY
    ID;
