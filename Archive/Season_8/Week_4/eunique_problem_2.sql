# Programmers > SELECT > 강원도에 위치한 생산공장 목록 출력하기 
# https://school.programmers.co.kr/learn/courses/30/lessons/131112
# SELECT 문 기본 연습 
  
-- 코드를 입력하세요
SELECT
    f.FACTORY_ID, # allias(별칭) 단수 설정 
    f.FACTORY_NAME,
    f.ADDRESS
FROM FOOD_FACTORY AS f 
WHERE ADDRESS LIKE '강원도%' # '강원도 공장'이라는 조건을 보지 못하고 빼먹었던 줄 
ORDER BY f.FACTORY_ID;

