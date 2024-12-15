CREATE VIEW DEPT_INFO(DeptName, MgrFname, MgrLname, MgrSalary)
AS 
SELECT D.Dname, E.Fname, E.Lname, E.Salary
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.Mgr_ssn = E.Ssn

CREATE VIEW EMP_RES(Name, Supervisor, Salary)
AS 
SELECT E.Fname, S.Fname, E.Salary
FROM EMPLOYEE E , EMPLOYEE S
WHERE E.Super_ssn = S.Ssn AND Dno IN (
    SELECT D.Dnumber
    FROM DEPARTMENT D
    WHERE D.Dname = 'Research'
)

CREATE VIEW PROJECT(Pname, Dname, EmpNum, WorkHour)
AS
SELECT P.Pname, D.Dname, COUNT(*), SUM(W.Hours)
FROM PROJECT P, DEPARTMENT D, WORKS_ON W
WHERE P.Dnum = D.Dnumber AND P.Pnumber = W.Pno
GROUP BY P.Pnumber, P.Pname
HAVING COUNT(*) > 1;