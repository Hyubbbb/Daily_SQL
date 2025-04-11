-- https://solvesql.com/problems/join/

SELECT DISTINCT
  records.athlete_id
FROM
  records
JOIN
  events ON records.event_id = events.id
WHERE
  events.sport = 'Golf';