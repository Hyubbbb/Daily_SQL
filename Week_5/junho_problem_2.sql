SELECT unique_id, name
FROM Employees AS e
LEFT OUTER JOIN EmployeeUNI AS eu
ON e.id = eu.id;
