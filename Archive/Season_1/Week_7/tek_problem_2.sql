/* HackerRank The Blunder
https://www.hackerrank.com/challenges/the-blunder/submissions/code/318916589 */

SELECT CEIL(AVG(Salary)-AVG(REPLACE(CONVERT(Salary, CHAR), 0, "")))
FROM EMPLOYEES