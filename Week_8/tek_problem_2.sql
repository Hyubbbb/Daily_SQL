/* HackerRank Top Earners
https://www.hackerrank.com/challenges/earnings-of-employees/submissions/code/318918707 */

SELECT salary * months as monthly_salary, COUNT(name)
FROM EMPLOYEE
GROUP BY monthly_salary
ORDER BY monthly_salary DESC
limit 1