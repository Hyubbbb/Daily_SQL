WITH friend_sal AS (SELECT f.ID, Friend_ID, Salary AS "Friend_Salary"
FROM Friends f JOIN Packages p ON f.Friend_ID=p.ID
ORDER BY Friend_ID), 

sal_name AS (
    SELECT s.ID, Name, Salary
    FROM Students s JOIN Packages p ON s.ID=p.ID
)


SELECT Name
FROM friend_sal f JOIN sal_name n ON f.ID = n.ID
WHERE Salary < Friend_Salary
ORDER BY Friend_Salary
