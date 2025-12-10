-- 없어진 기록 찾기 (윤다빈)
SELECT
  ao.animal_id,
  ao.name
FROM animal_outs ao
  LEFT OUTER JOIN animal_ins ai
    ON ao.animal_id = ai.animal_id
WHERE 1=1
  AND ai.animal_id IS NULL
ORDER BY
  ao.animal_id;

