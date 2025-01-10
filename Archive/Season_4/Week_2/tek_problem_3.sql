/* 610. Triangle Judgement
https://leetcode.com/problems/triangle-judgement/ */

SELECT *,
    CASE 
        WHEN (x + y + z - GREATEST(x, y, z)) <= GREATEST(x, y, z) THEN 'No'
        ELSE 'Yes'
    END as triangle
FROM Triangle