-- programmers / JOIN : 오랜 기간 보호한 동물(1) (Level 3)
SELECT 
    a1.name,
    a1.datetime
FROM animal_ins AS a1
    LEFT JOIN animal_outs AS a2
        ON a2.animal_id = a1.animal_id
WHERE a2.animal_id IS NULL
ORDER BY a1.datetime LIMIT 3
