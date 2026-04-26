SELECT 
    PT_NAME,
    PT_NO,
    GEND_cd,
    age,
    NVL(tlno, 'NONE')
FROM patient
WHERE 1=1
    AND age <= 12 
    AND gend_cd = 'W'   
ORDER BY age DESC, pt_name