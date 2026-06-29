SELECT
    outs.animal_id,
    outs.name
FROM animal_outs AS outs
    INNER JOIN animal_ins AS ins -- INNER JOIN으로, 입양을 보낸 animal_id만 남김
        ON outs.animal_id = ins.animal_id
ORDER BY DATEDIFF(outs.datetime, ins.datetime) DESC
LIMIT 2