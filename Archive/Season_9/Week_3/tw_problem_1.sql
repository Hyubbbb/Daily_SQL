-- https://solvesql.com/problems/blog-counter/
SELECT
  event_date_kst AS dt,
  COUNT(DISTINCT user_pseudo_id) AS users
FROM ga
WHERE 1=1
  AND event_date_kst BETWEEN '2021-08-02' AND '2021-08-09'
GROUP BY 1
ORDER BY 1
