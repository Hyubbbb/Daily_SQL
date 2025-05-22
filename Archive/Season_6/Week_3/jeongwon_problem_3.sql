-- 대장균의 크기에 따라 분류하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/301649

SELECT ID, 
       CASE
           WHEN RN <= total * 0.25 THEN 'CRITICAL'
           WHEN RN <= total * 0.50 THEN 'HIGH'
           WHEN RN <= total * 0.75 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS COLONY_NAME
FROM (
    SELECT d.ID,
           d.SIZE_OF_COLONY,
           @rn := @rn + 1 AS RN,
           t.total
    FROM (SELECT * FROM ECOLI_DATA ORDER BY SIZE_OF_COLONY DESC) d
    JOIN (SELECT @rn := 0) r
    JOIN (SELECT COUNT(*) AS total FROM ECOLI_DATA) t
) AS R
ORDER BY ID;
