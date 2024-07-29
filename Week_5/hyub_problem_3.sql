-- # Table 1: PATIENT
-- # Table 2: DOCTOR
-- # Table 3: APPOINTMENT

-- # 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회
--     # 진료예약일시를 기준으로 오름차순 정렬

SELECT a.APNT_NO, p.PT_NAME, p.PT_NO, a. MCDP_CD, d.DR_NAME, a.APNT_YMD
FROM APPOINTMENT a
JOIN PATIENT p on a.PT_NO = p.PT_NO
JOIN DOCTOR d on a.MDDR_ID = d.DR_ID
WHERE APNT_CNCL_YN = 'N'
    AND a.MCDP_CD = 'CS'
    AND DATE_FORMAT(APNT_YMD, '%Y-%m-%d') = '2022-04-13'
ORDER BY APNT_YMD
