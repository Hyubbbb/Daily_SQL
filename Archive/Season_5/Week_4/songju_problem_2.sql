-- https://solvesql.com/problems/inspect-penguins/

SELECT DISTINCT species, island
FROM penguins
ORDER BY island ASC, species ASC;
