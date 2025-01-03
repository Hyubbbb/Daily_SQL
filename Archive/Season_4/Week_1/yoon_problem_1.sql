-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
-- The Report

SELECT IF(g.Grade<8, NULL, s.Name), g.Grade, s.Marks 
FROM Students AS s 
JOIN Grades AS g 
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark 
ORDER BY g.Grade DESC, s.Name, s.Marks;
