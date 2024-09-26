/* HackerRank Higher Than 75 Marks
https://www.hackerrank.com/challenges/more-than-75-marks/submissions */

SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC