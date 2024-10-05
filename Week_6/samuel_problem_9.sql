-- https://school.programmers.co.kr/learn/courses/30/lessons/132202
-- Use backticks for aliasing, or not alias at all

SELECT
    MCDP_CD AS 진료과코드,
    COUNT(*) AS "5월예약건수"
FROM APPOINTMENT
WHERE APNT_YMD BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY MCDP_CD
ORDER BY COUNT(*) ASC, MCDP_CD ASC;