-- (https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true)

SELECT h.hacker_id, name, SUM(score) AS sum_score
FROM hackers AS h
JOIN (SELECT hacker_id, challenge_id, MAX(score) as score
        FROM submissions
        GROUP BY hacker_id, challenge_id) AS s
ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, name
HAVING sum_score != 0
ORDER BY sum_score desc, h.hacker_id;
