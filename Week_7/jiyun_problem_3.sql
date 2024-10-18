SELECT name
FROM Students A JOIN Friends B ON A.ID = B.ID
    JOIN Packages C ON A.ID = C.ID 
    JOIN (SELECT id, salary AS friend_salary FROM Packages) D ON B.friend_id = D.ID
WHERE salary < friend_salary
ORDER BY friend_salary;
