/* HackerRank The PADS
https://www.hackerrank.com/challenges/the-pads/submissions/code/319916293 */

SELECT CONCAT(Name, "(", LEFT(Occupation, 1), ")") as edit
FROM OCCUPATIONS

UNION ALL

SELECT CONCAT("There are a total of ", COUNT(Occupation), " ", LOWER(Occupation), "s.")
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY edit