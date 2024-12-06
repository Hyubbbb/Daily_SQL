/* LeetCode 620. Not Boring Movies
https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50 */


SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description != "boring"
ORDER BY rating DESC