SELECT name, bonus
FROM Employee E
    LEFT JOIN Bonus B ON E.empId = B.empId
WHERE bonus < 1000 or bonus IS NULL
