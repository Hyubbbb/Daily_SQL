SELECT
    ai.animal_id,
    ai.animal_type,
    ai.name
FROM animal_ins AS ai
    JOIN animal_outs AS ao
        ON ai.animal_id = ao.animal_id
            AND ai.sex_upon_intake != ao.sex_upon_outcome -- WHERE 절에서 Intact만 남긴 후, 이 조건을 통해 필터링 가능
WHERE 1=1
    AND ai.sex_upon_intake IN ('Intact Male', 'Intact Female') -- 보호소 입소 당시, Intact인 개체만 남김
ORDER BY animal_id