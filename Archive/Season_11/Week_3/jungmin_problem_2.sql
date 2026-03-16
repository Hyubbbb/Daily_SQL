-- 최근 올림픽이 개최된 도시
-- https://solvesql.com/problems/olympic-cities/
SELECT
  year,
  UPPER(LEFT(city, 3)) AS city
FROM games
WHERE 1=1
  AND year >= 2000
ORDER BY year DESC;
