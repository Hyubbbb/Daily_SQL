'섭쿼리에 조건절'

SELECT ID, NAME, HOST_ID
FROM PLACES 
WHERE HOST_ID IN (SELECT HOST_ID 
                  FROM PLACES
                  GROUP BY HOST_ID
                  HAVING COUNT(*) >= 2)
ORDER BY ID;
