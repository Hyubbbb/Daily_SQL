/* leetcode 196. Delete Duplicate Emails
https://leetcode.com/problems/delete-duplicate-emails/description/ */

/* my solution */
DELETE FROM Person
WHERE ctid IN (
    SELECT a.ctid
    FROM (
        SELECT ctid, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as num
        FROM Person
    ) a
    WHERE a.num > 1
)

/* Other Solution
DELETE FROM Person p1
USING Person p2
WHERE p1.email = p2.email AND p1.id > p2.id; */