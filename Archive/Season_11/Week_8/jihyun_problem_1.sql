-- https://school.programmers.co.kr/learn/courses/30/lessons/132201

SELECT 
    pt_name,
    pt_no,
    gend_cd,
    age,
    CASE 
        WHEN tlno IS NOT NULL
            THEN tlno
        WHEN tlno IS NULL
            THEN 'NONE'
        END AS tlno
FROM patient
WHERE 1=1
    AND age <= 12
    AND gend_cd = 'W'
ORDER BY age DESC, pt_name
