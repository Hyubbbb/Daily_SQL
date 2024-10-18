WITH perfect AS (
    SELECT h.hacker_id, name, COUNT(challenge_id) as cnt
    FROM Hackers h
    JOIN Challenges c
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, name
    HAVING COUNT(challenge_id) = (SELECT COUNT(challenge_id)
                                   FROM Hackers h
                                   JOIN Challenges c
                                   ON h.hacker_id = c.hacker_id
                                   GROUP BY h.hacker_id, name
                                   ORDER BY COUNT(challenge_id) desc
                                   LIMIT 1)
    ORDER BY COUNT(challenge_id) desc, h.hacker_id
),

rest AS (
    SELECT h.hacker_id, name, COUNT(challenge_id) AS cnt, ROW_NUMBER() OVER(PARTITION BY COUNT(challenge_id) ORDER BY h.hacker_id) AS rn
    FROM Hackers h
    JOIN Challenges c
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, name
    HAVING COUNT(challenge_id) < (SELECT COUNT(challenge_id)
                                   FROM Hackers h
                                   JOIN Challenges c
                                   ON h.hacker_id = c.hacker_id
                                   GROUP BY h.hacker_id, name
                                   ORDER BY COUNT(challenge_id) desc
                                   LIMIT 1)
    ORDER BY COUNT(challenge_id) desc, h.hacker_id
)


SELECT hacker_id, name, cnt AS challenges_created
FROM perfect

UNION ALL

SELECT hacker_id, name, cnt AS challenges_created
FROM rest
WHERE rn = 1 AND cnt NOT IN (SELECT cnt
                            FROM rest
                            WHERE rn=2)
