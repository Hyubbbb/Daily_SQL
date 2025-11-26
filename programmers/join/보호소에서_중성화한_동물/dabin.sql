-- 보호소에서 중성화한 동물 (윤다빈)
SELECT
    a.animal_id,
    a.animal_type,
    a.name
FROM animal_ins AS a
    JOIN animal_outs AS b
        ON a.animal_id = b.animal_id
WHERE 1 = 1
    AND a.sex_upon_intake LIKE 'Intact%'
    AND b.sex_upon_outcome NOT LIKE 'Intact%'
ORDER BY a.animal_id;
