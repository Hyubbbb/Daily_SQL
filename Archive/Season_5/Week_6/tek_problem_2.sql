/* leetcode Medium 한 번 더 풀기
1341. Movie Rating
https://leetcode.com/problems/movie-rating/description/ */

WITH CTE AS (
    SELECT mr.movie_id, m.title, mr.user_id, u.name, mr.rating, mr.created_at
    FROM MovieRating AS mr
    JOIN Users AS u
        ON mr.user_id = u.user_id
    JOIN Movies AS m
        ON mr.movie_id = m.movie_id
)
(
    SELECT name as results
    FROM CTE
    GROUP BY user_id, name
    ORDER BY COUNT(user_id) DESC, name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT title as results
    FROM CTE
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY title
    ORDER BY AVG(rating) DESC, title ASC
    LIMIT 1
)