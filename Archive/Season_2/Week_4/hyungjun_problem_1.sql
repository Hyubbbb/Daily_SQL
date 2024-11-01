경기도에 위치한 식품창고 목록 출력하기 | https://school.programmers.co.kr/learn/courses/30/lessons/131114

SELECT WAREHOUSE_ID,
    WAREHOUSE_NAME,
    ADDRESS,
    CASE  
        WHEN FREEZER_YN IS NULL THEN 'N'
        WHEN FREEZER_YN = 'Y' THEN 'Y'
        ELSE 'N'

    END AS FREEZER_YN
    
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE '경기도%'
ORDER BY WAREHOUSE_ID ASC 


------------------------------

SELECT warehouse_id, warehouse_name, address, IFNULL(freezer_yn, 'N') as freezer_yn
FROM food_warehouse
WHERE warehouse_name LIKE '%경기%'
ORDER BY warehouse_id

-------------------------------

SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, 
(
CASE 
    WHEN FREEZER_YN IS NOT NULL THEN FREEZER_YN
    ELSE 'N'
END     
) AS FREEZER_YN
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE ('경기%')
ORDER BY WAREHOUSE_ID ASC
