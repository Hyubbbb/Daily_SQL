--  Post Frequency Analysis
SELECT 
    user_id,
    DATEDIFF(MAX(post_date), MIN(post_date)) AS days_between_posts
FROM facebook_posts
WHERE EXTRACT(YEAR FROM post_date) = 2024
GROUP BY user_id
HAVING COUNT(post_id) >= 2;