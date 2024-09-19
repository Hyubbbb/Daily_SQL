SELECT A.hacker_id, B.name, sum(score_max) AS total_score
FROM (SELECT hacker_id, challenge_id, max(score) AS score_max
    FROM Submissions
    GROUP BY hacker_id, challenge_id) A 
JOIN Hackers B ON A.hacker_id = B.hacker_id
GROUP BY A.hacker_id, B.name HAVING sum(score_max) != 0
ORDER BY total_score DESC, hacker_id;
