SELECT
    CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id % 2 != 0 AND id + 1 in (SELECT id FROM Seat) THEN id + 1
        ELSE id
    END AS id
    , student
FROM Seat
ORDER BY id 
