-- https://school.programmers.co.kr/learn/courses/30/lessons/301650
SELECT ID
FROM ECOLI_DATA
WHERE PARENT_ID IN (SELECT ID
             FROM ECOLI_DATA
             WHERE PARENT_ID IN (SELECT ID
                                 FROM ECOLI_DATA
                                 WHERE PARENT_ID IS NULL))
ORDER BY ID ASC;