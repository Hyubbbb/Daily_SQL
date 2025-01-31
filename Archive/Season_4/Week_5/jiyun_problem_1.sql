SELECT species,
  ROUND(
    (SUM((flipper_length_mm-flip_mean)*(body_mass_g-body_mean))
    /
    (SQRT(SUM(POWER(flipper_length_mm-flip_mean,2)))*SQRT(SUM(POWER(body_mass_g-body_mean,2)))))
  ,3) AS corr
FROM (
  SELECT *,
    AVG(flipper_length_mm) OVER (PARTITION BY species) AS flip_mean,
    AVG(body_mass_g) OVER (PARTITION BY species) AS body_mean
    FROM penguins
    )
GROUP BY species
