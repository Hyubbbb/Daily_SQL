-- 그리 좋은 쿼리는 아닌 듯 하지만 WITH절을 차근차근 사용한 뒤 마지막에 UNION 해주는 방식으로 하면 크게 어려울 건 없다.
-- 많이 리뷰한 애
-- 가장 높은 평점 영화 in February

WITH num_rated AS (
    SELECT
        mr.user_id,
        u.name,
        COUNT(*) AS rated_num
    FROM movierating mr
        LEFT JOIN users u 
            USING(user_id)
    GROUP BY mr.user_id
    ORDER BY 3 DESC, name ASC
    LIMIT 1
), high_rated AS (
    SELECT
        mr.movie_id,
        m.title,
        AVG(mr.rating) AS rated_high
    FROM movierating mr
        LEFT JOIN movies m
            USING(movie_id)
    WHERE 1=1
        AND YEAR(mr.created_at) = 2020
        AND MONTH(mr.created_at) = 2
    GROUP BY mr.movie_id
    ORDER BY 3 DESC, 2
    LIMIT 1
)
  
SELECT 
  name AS results
FROM num_rated
UNION ALL
SELECT
  title
FROM high_rated
