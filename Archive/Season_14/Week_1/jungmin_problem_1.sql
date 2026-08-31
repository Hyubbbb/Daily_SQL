-- https://datalemur.com/questions/sql-histogram-tweets

WITH tweet_counts AS (
    SELECT
        user_id,
        COUNT(msg) AS tweet_bucket
    FROM tweets
    WHERE 1=1
        AND tweet_date >= '2022-01-01'
        AND tweet_date < '2023-01-01'
    GROUP BY user_id
)
SELECT
    tweet_bucket,
    COUNT(user_id) AS user_num
FROM tweet_counts
GROUP BY tweet_bucket
ORDER BY tweet_bucket;
