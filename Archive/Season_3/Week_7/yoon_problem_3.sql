SELECT Fname, Lname
FROM EMPLOYEE
WHERE Dno = (
    SELECT Dno
    FROM EMPLOYEE
    WHERE Salary = (
        SELECT MAX(Salary)
        FROM EMPLOYEE
    )


SELECT Fname, Lname
FROM EMPLOYEE
WHERE Super_ssn = (
    SELECT Ssn
    FROM EMPLOYEE
    WHERE Super_ssn = '88866555'
)


SELECT Fname, Lname
FROM EMPLOYEE
WHERE Salary >= (
    SELECT MIN(Salary) + 10000
    FROM EMPLOYEE
)