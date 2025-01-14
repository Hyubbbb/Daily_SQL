-- [PROGRAMMERS] String, Date > 취소되지 않은 진료 예약 조회하기

SELECT a.APNT_NO, p.PT_NAME, p.PT_NO, d.MCDP_CD, d.DR_NAME, a.APNT_YMD
FROM PATIENT p JOIN APPOINTMENT a
     ON p.PT_NO = a.PT_NO
     JOIN DOCTOR d ON a.MDDR_ID = d.DR_ID
WHERE DATE(a.APNT_YMD) = '2022-04-13'
  AND a.APNT_CNCL_YN = 'N'
  AND d.MCDP_CD = 'CS'
ORDER BY a.APNT_YMD
