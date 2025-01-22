SELECT name
FROM (
  SELECT G.name,
    CASE 
      WHEN P.name IN ('PS3', 'PS4', 'PSP', 'PSV') THEN 'Sony'
      WHEN P.name IN ('Wii', 'WiiU', 'DS', '3DS') THEN 'Nintendo'
      WHEN P.name IN ('X360', 'XONE') THEN 'Microsoft'
    END AS major
  FROM games G
  JOIN platforms P
    ON G.platform_id=P.platform_id
  WHERE year >= 2012 AND major IS NOT NULL
  GROUP BY G.name HAVING COUNT(DISTINCT major) >= 2
)
