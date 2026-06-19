-- https://leetcode.com/problems/rank-scores/submissions/2038384498
SELECT
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores
ORDER BY score DESC
