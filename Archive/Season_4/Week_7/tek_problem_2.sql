/* LeetCode 1527. Patients With a Condition
https://leetcode.com/problems/patients-with-a-condition/description/ */

SELECT *
FROM Patients
WHERE conditions LIKE '% DIAB1%'
    OR conditions LIKE 'DIAB1%'