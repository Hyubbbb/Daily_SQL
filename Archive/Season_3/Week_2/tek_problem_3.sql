/* LeetCode 1378. Replace Employee ID With The Unique Identifier
https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50 /*

SELECT UNI.unique_id, E.name
FROM Employees AS E
LEFT JOIN EmployeeUNI as UNI
    ON E.id = UNI.id