SELECT DEPARTMENT.Name AS DepartmentName, EMPLOYEE.Name AS EmployeeName 
FROM DEPARTMENT 
JOIN EMPLOYEE 
ON DEPARTMENT.Dnumber = EMPLOYEE.Dno;