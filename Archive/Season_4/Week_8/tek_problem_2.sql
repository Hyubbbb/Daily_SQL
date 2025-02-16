/* leetcode 1517. Find Users With Valid E-Mails
https://leetcode.com/problems/find-users-with-valid-e-mails/description/ */

-- Write your PostgreSQL query statement below

SElECT *
FROM Users
WHERE mail LIKE '%@leetcode.com'
    AND SUBSTRING(mail, 1, GREATEST(LENGTH(mail) - 13, 1)) ~* '^[a-z][a-z0-9._-]*$'
