SELECT S.Name, S.Major
FROM STUDENT S
JOIN GRADE_REPORT G
ON S.Student_number = G.Student_number
GROUP BY S.Student_number
HAVING SUM (CASE WHEN G.Grade = 'A' THEN 1 ELSE 0 END) = 0

SELECT S.Name, S.Major
FROM STUDENT S
WHERE S.Student_number NOT IN (
    SELECT G.Student_number
    FROM GRADE_REPORT G
    WHERE G.Grade = 'A'
)
