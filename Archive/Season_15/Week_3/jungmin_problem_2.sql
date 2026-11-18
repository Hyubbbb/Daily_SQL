-- https://platform.stratascratch.com/coding/10803-completion-rate-by-title
SELECT
    t.title_name,
    ROUND(100.0 * SUM(s.completed) / COUNT(*), 1) AS completion_pct
FROM stream_sessions AS s
    JOIN stream_titles AS t
        ON s.title_id = t.title_id
GROUP BY s.title_id
HAVING COUNT(s.title_id) >= 100
