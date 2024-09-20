-- https://school.programmers.co.kr/learn/courses/30/lessons/284530
-- 연도 별 평균 미세먼지 농도 조회하기

SELECT 
    EXTRACT(YEAR FROM YM) AS YEAR,  -- 날짜에서 연도만 추출하여 'YEAR' 컬럼으로 출력
    ROUND(AVG(PM_VAL1), 3) AS PM10,  -- 미세먼지(PM10) 오염도의 평균을 소수 셋째 자리에서 반올림하여 'PM10' 컬럼으로 출력
    ROUND(AVG(PM_VAL2), 3) AS PM2_5  -- 초미세먼지(PM2.5) 오염도의 평균을 소수 셋째 자리에서 반올림하여 'PM2.5' 컬럼으로 출력
FROM 
    AIR_POLLUTION  -- 전국의 미세먼지 정보를 담고 있는 테이블
WHERE 
    LOCATION1 = '경기도'  -- 지역구분1에서 '경기도'를 필터링
    AND LOCATION2 = '수원'  -- 지역구분2에서 '수원'을 필터링
GROUP BY 
    EXTRACT(YEAR FROM YM)  -- 연도별로 그룹화하여 평균을 계산
ORDER BY 
    YEAR ASC;  -- 연도별로 오름차순 정렬
