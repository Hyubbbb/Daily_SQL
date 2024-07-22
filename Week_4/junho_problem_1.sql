-- (https://school.programmers.co.kr/learn/courses/30/lessons/132202, Lv.2)

SELECT MCDP_CD AS 진료과코드, COUNT(*) AS 5월예약건수
FROM APPOINTMENT
WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 5
GROUP BY 진료과코드
ORDER BY 5월예약건수, 진료과코드;
