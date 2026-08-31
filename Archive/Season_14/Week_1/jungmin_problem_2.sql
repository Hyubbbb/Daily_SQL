-- https://datalemur.com/questions/matching-skills

SELECT candidate_id
FROM candidates
WHERE 1=1
    AND skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) >= 3;
