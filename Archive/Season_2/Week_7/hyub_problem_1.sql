-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

SELECT NULLIF(s.NAME, g.GRADE >= 8), g.GRADE, s.MARKS
FROM STUDENTS s
-- JOIN GRADES g on (g.Min_mark <= s.Marks AND s.Marks <= g.Max_mark)
JOIN GRADES g on s.Marks BETWEEN g.Min_mark AND g.Max_mark

ORDER BY GRADE DESC, NAME, MARKS
