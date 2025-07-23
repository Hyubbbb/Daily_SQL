-- https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50
(SELECT
    u.name AS results
FROM MovieRating AS mr
JOIN Users AS u
    ON mr.user_id = u.user_id
GROUP BY mr.user_id
ORDER BY COUNT(*) DESC, u.name ASC
LIMIT 1)
UNION ALL
(SELECT
    MAX(m.title) AS results
FROM MovieRating AS mr
JOIN Movies AS m
    ON mr.movie_id = m.movie_id
WHERE LEFT(mr.created_at, 7) = '2020-02'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1)
