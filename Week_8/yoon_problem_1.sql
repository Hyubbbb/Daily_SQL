WITH BEFORE AS (SELECT *
                FROM animal_ins
                WHERE sex_upon_intake LIKE 'Intact%'),
AFTER AS (SELECT *
          FROM animal_outs
          WHERE sex_upon_outcome NOT LIKE 'Intact%')

SELECT AFTER.animal_id, AFTER.animal_type, AFTER.name
FROM BEFORE, AFTER
WHERE BEFORE.animal_id=AFTER.animal_id;
