SELECT ai.animal_id,
       ai.name
FROM animal_ins as ai
  JOIN animal_outs as ao
    ON ai.animal_id = ao.animal_id
WHERE 1=1
  AND ai.datetime > ao.datetime
ORDER BY ai.datetime
