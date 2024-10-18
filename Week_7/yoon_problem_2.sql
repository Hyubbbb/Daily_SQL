SELECT outs.animal_id, outs.name
FROM animal_outs AS outs LEFT OUTER JOIN animal_ins AS ins
ON ins.animal_id = outs.animal_id
WHERE isnull(ins.animal_id);
