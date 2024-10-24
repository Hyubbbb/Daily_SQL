--  hacker_id, name, and the total number of challenges created by each student
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

WITH num_challenge AS (
    SELECT H.hacker_id AS hacker_id,
        H.name AS name, 
        COUNT(C.challenge_id) AS challenges_created
    FROM hackers H
        JOIN challenges C
        ON H.hacker_id = C.hacker_id
    GROUP BY hacker_id, name)

-- NO DUPLICATION OF challenges_created TABLE
SELECT hacker_id, name, challenges_created
FROM num_challenge
WHERE challenges_created 
    IN (
        SELECT challenges_created FROM num_challenge
        GROUP BY challenges_created HAVING COUNT(challenges_created) = 1 
        ) 

UNION

-- THE MAXIMUM NUMBER OF challenges_created
SELECT hacker_id, name, challenges_created
FROM num_challenge
WHERE challenges_created = (SELECT MAX(challenges_created) FROM num_challenge)

ORDER BY challenges_created DESC, hacker_id
