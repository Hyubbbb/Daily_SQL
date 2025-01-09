-- 환자, 의사, 예약
-- 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 SQL문
-- 굳이 마지막 출력에서 컬럼명 다 다르게. 바꿔야되는거 진 짜화 남

WITH cancel AS (
    SELECT 
    APNT_YMD, 
    APNT_NO, 
    PT_NO, 
    a.MCDP_CD, 
    MDDR_ID, 
    DR_NAME
FROM APPOINTMENT a JOIN DOCTOR d ON MDDR_ID = DR_ID
WHERE YEAR(APNT_YMD)=2022 AND MONTH(APNT_YMD) = 4 AND DAY(APNT_YMD) = 13 AND a.MCDP_CD = 'CS' AND APNT_CNCL_YN = 'N')


-- SELECT *
-- FROM cancel

SELECT APNT_NO AS 'APNTNO', PT_NAME AS 'PTNAME', c.PT_NO AS 'PTNO', MCDP_CD AS 'MCDPCD', DR_NAME AS 'DRNAME', APNT_YMD AS 'APNTYMD'
FROM cancel c JOIN PATIENT p ON c.PT_NO = p.PT_NO
ORDER BY APNT_YMD
