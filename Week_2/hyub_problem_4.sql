-- https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true
SELECT NAME
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID
