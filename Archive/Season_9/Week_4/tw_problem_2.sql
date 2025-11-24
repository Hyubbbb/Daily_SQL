-- https://solvesql.com/problems/join/
SELECT DISTINCT(athlete_id)
FROM events e
  JOIN records r
    ON r.event_id = e.id
WHERE sport = 'Golf'
