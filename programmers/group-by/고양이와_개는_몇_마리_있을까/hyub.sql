SELECT
    animal_type,
    COUNT(*) AS count
FROM animal_ins
WHERE 1=1
    AND animal_type IN ('Cat', 'Dog')
GROUP BY animal_type
ORDER BY FIELD(animal_type, 'Cat', 'Dog');