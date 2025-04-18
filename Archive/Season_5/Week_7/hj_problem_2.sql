-- https://school.programmers.co.kr/learn/courses/30/lessons/301649
SELECT ID,
CASE NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC)
           WHEN 1 THEN 'CRITICAL'
           WHEN 2 THEN 'HIGH'
           WHEN 3 THEN 'MEDIUM'
       ELSE 'LOW' END AS COLONY_NAME
FROM ECOLI_DATA
ORDER BY ID ASC;