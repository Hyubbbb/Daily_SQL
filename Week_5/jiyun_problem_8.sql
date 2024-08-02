-- 코드를 작성해주세요
SELECT ID,
    CASE 
    WHEN A.PER <= 0.25 THEN 'CRITICAL'
    WHEN A.PER > 0.25 AND A.PER <= 0.50 THEN 'HIGH'
    WHEN A.PER > 0.50 AND A.PER <= 0.75 THEN 'MEDIUM'
    ELSE 'LOW'
    END AS COLONY_NAME
FROM (SELECT ID, PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PER
      FROM ECOLI_DATA) A
ORDER BY ID
