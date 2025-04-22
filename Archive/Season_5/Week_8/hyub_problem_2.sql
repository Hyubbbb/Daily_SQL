-- https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50

SELECT *
FROM Cinema
WHERE 
    id mod 2 = 1 # Condition1: Odd id
    AND 
    description != 'boring' # Condition2: Not boring
ORDER BY rating DESC
