WITH MAX_SIZE AS
(SELECT YEAR(DIFFERENTIATION_DATE) AS YEAR, MAX(SIZE_OF_COLONY) AS MAX_SIZE
FROM ECOLI_DATA
GROUP BY YEAR)
SELECT M.YEAR, (MAX_SIZE - E.SIZE_OF_COLONY) AS YEAR_DEV, ID
FROM ECOLI_DATA AS E
LEFT JOIN MAX_SIZE M 
ON YEAR(E.DIFFERENTIATION_DATE) = M.YEAR
ORDER BY M.YEAR, YEAR_DEV;
