-- 프로그래머스 취소되지 않은 진료 예약 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/132204

SELECT A.APNT_NO, P.PT_NAME, P.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
FROM APPOINTMENT AS A
INNER JOIN PATIENT AS P
    ON A.PT_NO = P.PT_NO
INNER JOIN DOCTOR AS D
    -- 의사ID를 기준으로 INNER JOIN
    ON A.MDDR_ID = D.DR_ID
WHERE A.MCDP_CD = "CS" 
    AND APNT_CNCL_YN="N"
    -- 4월 13일 기준으로 필터링
    AND MONTH(A.APNT_YMD) = 4
    AND DAY(A.APNT_YMD) = 13
ORDER BY A.APNT_YMD ASC