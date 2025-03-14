SELECT h.hacker_id, h.name, SUM(max_score) AS total_score

-- 서브쿼리를 통해 풀이한 문제 별, 최대 점수를 따로 미리 뽑아놓고
-- 외부 쿼리에서 그 총합을 구하기만 하면 됨
FROM Hackers h JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS c
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
-- 총합 점수가 0인 애들은 HAVING절로 필터링!

ORDER BY total_score DESC, h.hacker_id
