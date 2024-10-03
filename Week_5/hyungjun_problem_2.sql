12세 이하인 여자 환자 목록 출력하기 | https://school.programmers.co.kr/learn/courses/30/lessons/132201


SELECT PT_NAME,PT_NO,GEND_CD,AGE,
    CASE WHEN TLNO IS NULL THEN 'NONE' ELSE TLNO END AS TLNO
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME ASC


SELECT PT_NAME, PT_NO, GEND_CD, AGE, if(TLNO is NULL, 'NONE', TLNO)  TLNO
from PATIENT
where AGE <= 12 and GEND_CD = 'W'
order by AGE desc, PT_NAME
