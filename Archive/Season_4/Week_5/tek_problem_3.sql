/* leetcode 1341. Movie Rating
https://leetcode.com/problems/movie-rating/description/ */

-- Write your PostgreSQL query statement below

WITH CTE AS (
    SELECT *
    FROM MovieRating as mr
    INNER JOIN Movies as m
        ON mr.movie_id = m.movie_id
    INNER JOIN Users as u
        ON mr.user_id = u.user_id
)

(
    SELECT c1.name as results
    FROM CTE as c1
    GROUP BY c1.name
    ORDER BY COUNT(c1.name) DESC, c1.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT c2.title as results
    FROM CTE as c2
    WHERE c2.created_at > '2020-01-31' AND c2.created_at < '2020-03-01'
    GROUP BY c2.title
    ORDER BY AVG(c2.rating) DESC, c2.title ASC
    LIMIT 1
)