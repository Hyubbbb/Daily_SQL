/*
leetcode 175. Combine Two Tables
https://leetcode.com/problems/combine-two-tables/
*/

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person as p
LEFT JOIN Address as a
    ON p.personId = a.personId