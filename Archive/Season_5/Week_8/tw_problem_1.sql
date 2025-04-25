-- 최고 점수에 대한 서브쿼리부터 만들어놓고 생각 => b
-- 그 뒤부턴 쉽다

SELECT h.hacker_id, h.name, SUM(best_score) AS total_score
FROM Hackers h JOIN
    (SELECT hacker_id, challenge_id, MAX(score) as best_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id) b ON h.hacker_id=b.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(best_score) > 0
ORDER BY
    total_score DESC,
    h.hacker_id ASC
