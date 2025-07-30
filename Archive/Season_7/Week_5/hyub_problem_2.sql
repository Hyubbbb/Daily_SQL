-- https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan-v2&envId=top-sql-50
DELETE p
FROM Person AS p
JOIN (
    SELECT 
        MIN(id) AS id,
        email
    FROM Person
    GROUP BY email
) AS keep
ON p.email = keep.email AND p.id != keep.id;
