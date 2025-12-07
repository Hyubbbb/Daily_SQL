SELECT
  title,
  year,
  rotten_tomatoes
FROM movies
WHERE 1=1
  AND title LIKE '%Love%' OR title LIKE '%love%'
ORDER BY 3 DESC, 2 DESC
