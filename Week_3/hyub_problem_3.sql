-- https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=true

-- contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id.
-- Contests (contest_id, hacker_id)
    -- contest_id, hacker_id, name
-- Colleges (contest_id, college_id)
-- Challenges (challenge_id, college_id)
-- View_Stats (challenge_id)
    -- the sum of total_views
    -- the sum of total_unique_views
-- Submission_Stats (challenge_id)
    -- the sum of total_submissions, 
    -- the sum of total_accepted_submissions

SELECT  ct.contest_id, ct.hacker_id, ct.name,
    ifnull(SUM(ss.sum_ts), 0) AS sumsum_ts,
    ifnull(SUM(ss.sum_tas), 0) AS sumsum_tas,
    ifnull(SUM(vs.sum_tv), 0) AS sumsum_tv,
    ifnull(SUM(vs.sum_tuv),0) AS sumsum_tuv
FROM Contests ct
LEFT JOIN Colleges c on ct.contest_id = c.contest_id
LEFT JOIN Challenges cl on cl.college_id = c.college_id
LEFT JOIN (SELECT challenge_id, SUM(total_submissions) AS sum_ts,
           SUM(total_accepted_submissions) AS sum_tas
            FROM Submission_Stats
            GROUP BY challenge_id)ss
            on cl.challenge_id = ss.challenge_id
LEFT JOIN (SELECT challenge_id, SUM(total_views) AS sum_tv,
           SUM(total_unique_views) AS sum_tuv
            FROM View_Stats
            GROUP BY challenge_id)vs
            on cl.challenge_id = vs.challenge_id
GROUP BY ct.contest_id, ct.hacker_id, ct.name
HAVING sumsum_tv + sumsum_tuv + sumsum_ts + sumsum_tas > 0
ORDER BY ct.contest_id
