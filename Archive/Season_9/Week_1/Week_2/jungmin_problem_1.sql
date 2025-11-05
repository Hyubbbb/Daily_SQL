-- programmers (String, Date) : 중성화 여부 파악하기 (LEVEL 2)
SELECT
    animal_id,
    name,
    CASE 
        WHEN sex_upon_intake LIKE '%Neutered%' 
            OR sex_upon_intake LIKE '%Spayed%' THEN 'O'
        ELSE 'X'
    END AS '중성화'
FROM animal_ins
