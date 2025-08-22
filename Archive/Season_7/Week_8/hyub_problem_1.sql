-- https://leetcode.com/problems/find-users-with-valid-e-mails/?envType=study-plan-v2&envId=top-sql-50
SELECT
    user_id,
    name, 
    mail
FROM Users
WHERE 1=1
    -- AND mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$'
    AND REGEXP_LIKE(mail, '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$', 'c')
