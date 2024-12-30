SELECT DISTINCT athlete_id
FROM records rec
WHERE event_id IN (SELECT id FROM events WHERE sport = 'Golf')
