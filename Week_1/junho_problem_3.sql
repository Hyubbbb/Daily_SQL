SELECT s.hacker_id, name
FROM submissions s
JOIN hackers h
ON s.hacker_id = h.hacker_id
JOIN challenges c
ON s.challenge_id = c.challenge_id
JOIN difficulty d
ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY s.hacker_id, name
HAVING COUNT(s.hacker_id) >= 2
ORDER BY COUNT(s.hacker_id) desc, s.hacker_id;
