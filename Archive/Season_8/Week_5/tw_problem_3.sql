-- Write your MySQL query statement below
SELECT
    *
FROM patients
WHERE 1=1
    AND conditions LIKE "DIAB1%"
    OR conditions LIKE "% DIAB1%"
