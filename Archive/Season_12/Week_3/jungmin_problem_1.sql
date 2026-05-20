-- https://solvesql.com/problems/join/
SELECT rec.athlete_id
FROM events AS eve
    JOIN records AS rec
        ON eve.id = rec.event_id
WHERE 1=1
    AND eve.sport = 'Golf'
GROUP BY rec.athlete_id;

-- SELECT DISTINCT rec.athlete_id
-- FROM events AS eve
--     JOIN records AS rec
--         ON eve.id = rec.event_id
-- WHERE 1=1
--     AND eve.sport = 'Golf'
