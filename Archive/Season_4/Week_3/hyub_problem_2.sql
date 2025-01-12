-- https://solvesql.com/problems/correlation-penguin/

WITH peng2 AS
  (SELECT
    species,
    COUNT(*) - 1 AS cnt,
    AVG(body_mass_g) AS avg_mass,
    AVG(flipper_length_mm) AS avg_length
  FROM penguins
  GROUP BY species)

SELECT
  p1.species,
  ROUND((SUM((body_mass_g - avg_mass) * (flipper_length_mm - avg_length)) / cnt) / (SQRT(SUM((body_mass_g - avg_mass) * (body_mass_g - avg_mass)) / cnt) * SQRT(SUM((flipper_length_mm - avg_length) * (flipper_length_mm - avg_length)) / cnt)), 3) AS corr
FROM penguins p1
LEFT JOIN peng2 p2
  on p1.species = p2.species
GROUP BY p1.species
