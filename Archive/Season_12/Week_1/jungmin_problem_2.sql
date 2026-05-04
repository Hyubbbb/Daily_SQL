-- https://solvesql.com/problems/species-and-mass-of-penguins/
SELECT
    species,
    body_mass_g
FROM penguins
WHERE 1=1
    AND species IS NOT NULL
    AND body_mass_g IS NOT NULL
ORDER BY body_mass_g DESC, species;
