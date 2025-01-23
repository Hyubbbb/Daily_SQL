-- 두 개 이상의 챌린지에서 만점을 받은 해커의 이름과 해커_id를 출력
-- Difficulty 테이블의 score는 총점
-- Submissions 테이블의 socre는 시험자 점수
-- 조건 1. 만점을 받은 해커
-- 조건 2. 두 개 이상의 챌린지에서

WITH full_score_table AS (SELECT s.hacker_id, s.challenge_id
    FROM Submissions s
    JOIN Challenges c ON s.challenge_id = c.challenge_id
    JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
),
hacker_full_score_count AS (SELECT hacker_id, COUNT(challenge_id) AS full_score_count
    FROM full_score_table
    GROUP BY hacker_id
    HAVING COUNT(challenge_id) > 1
)
SELECT h.hacker_id, h.name
FROM hacker_full_score_count f JOIN Hackers h ON f.hacker_id = h.hacker_id
ORDER BY 
    f.full_score_count DESC, 
    h.hacker_id
