-- 없어진 기록 찾기 (윤다빈)
SELECT
  outs.animal_id,
  outs.name
FROM animal_outs outs
  LEFT OUTER JOIN animal_ins ins
    ON outs.animal_id = ins.animal_id
WHERE 1=1
  AND ins.animal_id IS NULL
ORDER BY
  outs.animal_id
