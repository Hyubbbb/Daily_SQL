SELECT S.Name, S.Major
FROM STUDENT S
JOIN GRADE_REPORT G
ON S.Student_number = G.Student_number
GROUP BY S.Student_number
HAVING SUM (CASE WHEN G.Grade <> 'A' THEN 1 ELSE 0 END)


WHERE 'A' = ALL (
    SELECT G.Grade
    FROM Grade_REPORT G
    WHERE S.Student_number = G.Student_number
)