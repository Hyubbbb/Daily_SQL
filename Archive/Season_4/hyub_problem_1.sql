-- https://solvesql.com/problems/multiplatform-games/

SELECT
  g.name AS name
FROM games g
JOIN platforms p
  on g.platform_id = p.platform_id
WHERE year >= 2012
GROUP BY g.name
  HAVING
    (SUM(CASE WHEN p.name IN ('PS3', 'PS4', 'PSP', 'PSV') THEN 1 ELSE 0 END) >= 1
    OR SUM(CASE WHEN p.name IN ('Wii', 'WiiU', 'DS', '3DS') THEN 1 ELSE 0 END) >= 1
    OR SUM(CASE WHEN p.name IN ('X360', 'XONE') THEN 1 ELSE 0 END) >= 1)

    AND 
      (CASE WHEN (SUM(CASE WHEN p.name IN ('PS3', 'PS4', 'PSP', 'PSV') THEN 1 ELSE 0 END)) > 0 THEN 1 ELSE 0 END
      + CASE WHEN (SUM(CASE WHEN p.name IN ('Wii', 'WiiU', 'DS', '3DS') THEN 1 ELSE 0 END)) > 0 THEN 1 ELSE 0 END
      + CASE WHEN (SUM(CASE WHEN p.name IN ('X360', 'XONE') THEN 1 ELSE 0 END) >= 1) > 0 THEN 1 ELSE 0 END) >= 2

