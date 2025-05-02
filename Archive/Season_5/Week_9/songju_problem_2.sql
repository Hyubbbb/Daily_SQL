-- https://solvesql.com/problems/publisher-with-many-games/

SELECT c.name
FROM games g
JOIN companies c ON g.publisher_id = company_id
GROUP BY c.name
HAVING COUNT(*) >= 10;
