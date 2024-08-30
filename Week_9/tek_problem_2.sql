/* HackerRank The Report
https://www.hackerrank.com/challenges/the-report/submissions/code/320288634 */


SELECT 
    CASE
        WHEN G.Grade < 8 THEN NULL
        ELSE S.Name
    END as Over_8,
    G.Grade,
    S.Marks
FROM Students S
-- Using LEFT JOIN to use table Grade for checking grade from S.Marks
LEFT JOIN Grades G
    ON (S.Marks BETWEEN G.Min_Mark AND G.Max_Mark)
ORDER BY G.Grade DESC, S.Name