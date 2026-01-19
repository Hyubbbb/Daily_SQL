SELECT
    ai.name,
    ai.datetime
FROM animal_ins AS ai
    LEFT JOIN animal_outs AS ao
        ON ai.animal_id = ao.animal_id
WHERE 1=1
    AND ao.animal_id IS NULL -- 아직 입양을 못 간 동물만 필터링
ORDER BY ai.datetime -- 보호소에 들어온 날짜가 가장 짧은 동물부터 정렬
LIMIT 3