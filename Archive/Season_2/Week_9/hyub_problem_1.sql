-- https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

SELECT 
    -- s.ID AS ID,
    s.NAME AS NAME
    -- f.FRIEND_ID AS FRIEND_ID,
    -- p1.SALARY AS SALARY_MY,
    -- p2.SALARY AS SALARY_FR
FROM STUDENTS s
JOIN FRIENDS f on s.ID = f.ID
JOIN PACKAGES p1 on s.ID = p1.ID
JOIN PACKAGES p2 on f.FRIEND_ID = p2.ID

WHERE p1.SALARY < p2.SALARY

ORDER BY p2.SALARY
