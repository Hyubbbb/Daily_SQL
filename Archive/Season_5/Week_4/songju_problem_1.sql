-- https://solvesql.com/problems/find-christmas-games/

SELECT game_id, name, year
FROM games
WHERE name LIKE '%Christmas%' OR name LIKE '%Santa%';
