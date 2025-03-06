-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59414
-- ANIMAL_INS 테이블에서 필요한 정보를 선택하고, DATE 함수로 시간 정보를 제외한 날짜만 추출
-- 결과를 ANIMAL_ID 기준으로 오름차순 정렬

SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS 날짜
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;