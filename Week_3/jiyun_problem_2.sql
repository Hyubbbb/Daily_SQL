-- 코드를 입력하세요
SELECT PT_NAME, PT_NO, GEND_CD, AGE,
    CASE WHEN TLNO IS NULL THEN 'NONE'
    ELSE TLNO
    END AS TLNO
FROM PATIENT
WHERE GEND_CD = 'W' AND AGE <= 12
ORDER BY AGE DESC, PT_NAME;
