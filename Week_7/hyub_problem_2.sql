-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

SELECT ID, NAME
FROM 
    (SELECT s.HACKER_ID AS ID, s.SCORE, 
               c.DIFFICULTY_LEVEL, 
               d.SCORE AS MAX_SCORE, 
               h.NAME AS NAME,
               (CASE WHEN s.SCORE = d.SCORE THEN 1 ELSE 0 END) AS FULL

        FROM SUBMISSIONS s
        JOIN CHALLENGES c on s.CHALLENGE_ID = c.CHALLENGE_ID
        JOIN DIFFICULTY d on c.DIFFICULTY_LEVEL = d.DIFFICULTY_LEVEL
        JOIN HACKERS h on s.HACKER_ID = h.HACKER_ID
    ) AS TMP

GROUP BY ID, NAME
    HAVING SUM(FULL) >= 2

ORDER BY SUM(FULL) DESC, ID
