/* 619. Biggest Single Number
https://leetcode.com/problems/biggest-single-number/description/ */


SELECT max(g.num) as num
FROM (
    SELECT num, count(num) as cnt
    FROM MyNumbers
    GROUP BY num
    HAVING count(num) = 1
    ) as g