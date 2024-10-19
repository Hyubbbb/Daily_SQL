-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

SELECT 
    MAXX.HACKER_ID,
    h.NAME,
    SUM(SCORE_MAX) AS TOTAL_SCORE
FROM 
    (SELECT 
        HACKER_ID,
        MAX(SCORE) AS SCORE_MAX
    FROM SUBMISSIONS
    GROUP BY CHALLENGE_ID, HACKER_ID) AS MAXX

JOIN HACKERS h on MAXX.HACKER_ID = h.HACKER_ID

GROUP BY MAXX.HACKER_ID, h.NAME
    HAVING SUM(SCORE_MAX) != 0
ORDER BY TOTAL_SCORE DESC, MAXX.HACKER_ID
