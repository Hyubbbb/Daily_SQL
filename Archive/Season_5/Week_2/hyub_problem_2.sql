-- https://leetcode.com/problems/big-countries/submissions/1569978546/?envType=study-plan-v2&envId=top-sql-50

SELECT
    name
    , population
    , area
FROM World
WHERE area >= 3000000
    OR population >= 25000000
