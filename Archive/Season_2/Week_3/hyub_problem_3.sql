-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

-- print the hacker_id, name, and the total number of challenges created by each student
    -- Sort your results by the total number of challenges in descending order
    -- Sort the result by hacker_id
    -- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

WITH KEEP AS(
SELECT h.hacker_id, h.name, COUNT(challenge_id) AS challenges_created,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY COUNT(challenge_id)) > 1 THEN 'Duplicate'
        ELSE 'Unique' 
        END AS 'DorU'
FROM Hackers h
JOIN Challenges c on h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY challenges_created DESC, h.hacker_id)

SELECT hacker_id, name, challenges_created
FROM KEEP
WHERE DorU = 'Unique'
    OR (DorU = 'Duplicate' AND challenges_created = (SELECT challenges_created FROM KEEP ORDER BY challenges_created DESC LIMIT 1))
