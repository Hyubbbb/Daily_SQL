/*
leetcode 178. Rank Scores
https://leetcode.com/problems/rank-scores/description/
*/

SELECT score,
    DENSE_RANK() OVER (ORDER BY score DESC) as rank
FROM Scores