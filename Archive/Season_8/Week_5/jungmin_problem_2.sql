-- programmers / SUM,MAX,MIN : 중복 제거하기 (Level 2)
SELECT COUNT(DISTINCT name) AS count
FROM animal_ins
WHERE 1=1
    AND name IS NOT NULL
