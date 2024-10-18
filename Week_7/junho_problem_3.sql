WITH fs AS (SELECT f.ID AS fsid, Friend_ID AS fid, Salary
            FROM Friends f
            JOIN Packages p
            ON f.Friend_ID = P.ID
)

SELECT s.name
FROM fs
JOIN Packages p
ON fs.fsid = p.id
JOIN Students s
ON fs.fsid = s.id
WHERE p.salary < fs.salary
ORDER BY fs.salary;
