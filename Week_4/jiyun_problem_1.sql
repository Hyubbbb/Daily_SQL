WITH MIS_SALARY AS(
    SELECT Name, Salary, REPLACE(CAST(Salary AS CHAR), '0', '') AS MIS
    FROM EMPLOYEES)

SELECT CEIL(AVG(Salary) - AVG(CAST(MIS AS UNSIGNED))) FROM MIS_SALARY
