SELECT
    animal_id,
    name
FROM animal_ins
WHERE 1=1
    AND intake_condition = 'Sick'
ORDER BY animal_id