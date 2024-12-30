-- https://school.programmers.co.kr/learn/courses/30/lessons/131114
-- 경기도에 위치한 식품창고 목록 출력하기

SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N')
FROM FOOD_WAREHOUSE 
WHERE ADDRESS LIKE '경기도%'
ORDER BY WAREHOUSE_ID;


-- https://school.programmers.co.kr/learn/courses/30/lessons/59039
-- 이름이 없는 동물의 아이디

SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NULL;

-- https://school.programmers.co.kr/learn/courses/30/lessons/59407
-- 이름이 있는 동물의 아이디

SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
ORDER BY ANIMAL_ID;

-- https://school.programmers.co.kr/learn/courses/30/lessons/59410
-- NULL 처리하기

SELECT ANIMAL_TYPE, COALESCE(NAME, 'No name'), SEX_UPON_INTAKE
FROM ANIMAL_INS;

