-- https://leetcode.com/problems/patients-with-a-condition/?envType=study-plan-v2&envId=top-sql-50
SELECT *
FROM Patients
WHERE 1=1
    AND (conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%')
