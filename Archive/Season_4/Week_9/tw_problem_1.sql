
SELECT ROUND(LAT_N, 4)
FROM(SELECT LAT_N, PERCENT_RANK() OVER (ORDER BY LAT_N) percent
     FROM STATION) a
WHERE percent = 0.5

-- PERCENT_RANK():
-- 특정 칼럼에 대한 상대적 백분위 수를 구할 수 있음
-- 0~1의 범위로 결과값 (제일 크면 1, 제일 작으면 0)
