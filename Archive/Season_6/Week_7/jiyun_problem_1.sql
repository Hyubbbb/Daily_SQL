SELECT E.name
FROM Employee E
    JOIN (SELECT managerId FROM Employee) M ON E.id = M.managerId
GROUP BY E.id HAVING COUNT(*) >= 5
