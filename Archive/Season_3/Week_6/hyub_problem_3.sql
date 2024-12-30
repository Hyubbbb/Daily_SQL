-- https://solvesql.com/problems/publisher-with-many-games/

SELECT name
FROM companies main
WHERE company_id IN
  (SELECT publisher_id AS name
  FROM companies c
  JOIN games g on c.company_id = g.publisher_id
  GROUP BY publisher_id
    HAVING COUNT(game_id) >= 10)
