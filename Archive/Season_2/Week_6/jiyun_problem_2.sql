WITH STUDENT AS (
    SELECT ID, NAME, MARKS,
        CASE WHEN MARKS BETWEEN 0 AND 9 THEN 1
             WHEN MARKS BETWEEN 10 AND 19 THEN 2
             WHEN MARKS BETWEEN 20 AND 29 THEN 3
             WHEN MARKS BETWEEN 30 AND 39 THEN 4
             WHEN MARKS BETWEEN 40 AND 49 THEN 5
             WHEN MARKS BETWEEN 50 AND 59 THEN 6
             WHEN MARKS BETWEEN 60 AND 69 THEN 7
             WHEN MARKS BETWEEN 70 AND 79 THEN 8
             WHEN MARKS BETWEEN 80 AND 89 THEN 9
             WHEN MARKS BETWEEN 90 AND 100 THEN 10
        END AS GRADE
FROM STUDENTS)

SELECT 
    CASE WHEN GRADE < 8 THEN 'NULL'
         ELSE NAME
    END AS NAME, GRADE, MARKS
FROM STUDENT
ORDER BY GRADE DESC, NAME, MARKS;