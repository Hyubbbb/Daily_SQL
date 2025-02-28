WITH m AS (
    SELECT h.hacker_id, h.name, s.challenge_id, MAX(score) AS score
    FROM Hackers h
    RIGHT JOIN Submissions s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, h.name, s.challenge_id)

SELECT hacker_id, name, SUM(score) AS total_score
FROM m
GROUP BY hacker_id, name
HAVING SUM(score) > 0
ORDER BY total_score desc, hacker_id
 
-- 왜 자꾸 런타임 에러가 하
