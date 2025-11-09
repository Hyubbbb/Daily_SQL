Programmers > JOIN > 있었는데요 없었습니다
SELECT
    i.animal_id,
    i.name
FROM animal_ins i
    JOIN animal_outs o
        ON i.animal_id = o.animal_id
WHERE o.datetime < i.datetime
ORDER BY i.datetime;
