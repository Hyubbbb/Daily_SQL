-- https://school.programmers.co.kr/learn/courses/30/lessons/131112
-- Easy
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS LIKE '강원도%'
ORDER BY FACTORY_ID ASC;