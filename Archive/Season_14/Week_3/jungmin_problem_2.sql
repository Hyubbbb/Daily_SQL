-- https://datalemur.com/questions/sql-average-post-hiatus-1
SELECT 
    user_id, 
    DATEDIFF(MAX(DATE(post_date)), MIN(DATE(post_date))) AS days_between
FROM posts
WHERE 1=1
    AND YEAR(post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) > 1;
