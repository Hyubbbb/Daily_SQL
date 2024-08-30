-- 진료과별 총 예약 횟수 출력하기(programmers)
-- 처음에 진료과코드를 'MCDP_CD' 가 아니라 'MDDR_ID'로 조회해서 대체 왜 틀렸나 한참을 헤맴..문제 잘읽기
SELECT MCDP_CD AS "진료과 코드", COUNT(*) AS "5월예약건수"
FROM APPOINTMENT
WHERE DATE_FORMAT(APNT_YMD, '%Y-%m') = '2022-05'
GROUP BY MCDP_CD
ORDER BY COUNT(*), MCDP_CD
