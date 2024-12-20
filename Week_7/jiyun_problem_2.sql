-- SQL에서는 정수 연산이 기본이기 때문에, 정수 나누기 결과도 기본적으로 정수로 처리
-- 소수점 결과를 강제하기 위해 CAST 또는 CONVERT를 사용해 한쪽 값을 소수점 데이터 형식으로 변환 
-- OR 0.1곱하기!

SELECT ROUND(100.0 * (SELECT COUNT(*) FROM artworks WHERE credit LIKE '%gift%')/
(SELECT COUNT(*) FROM artworks), 3) AS ratio
