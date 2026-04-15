-- https://solvesql.com/problems/inspect-penguins/
SELECT
    species,
    island
FROM penguins
GROUP BY island, species
ORDER BY island, species;
