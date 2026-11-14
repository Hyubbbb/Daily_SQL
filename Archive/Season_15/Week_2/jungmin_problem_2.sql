-- https://datalemur.com/questions/sql-second-highest-salary
SELECT MAX(e1.salary) AS second_highest_salary
FROM employee AS e1
    JOIN employee AS e2
        ON e1.salary < e2.salary;
