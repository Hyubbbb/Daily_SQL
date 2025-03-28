-- https://school.programmers.co.kr/learn/courses/30/lessons/164670

SELECT USER_ID, NICKNAME, 
CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS 전체주소 ,
CONCAT(SUBSTRING(TLNO,1, 3), '-', 
       SUBSTRING(TLNO, 4, 4), '-', 
       SUBSTRING(TLNO, 8, 4)) AS 전화번호
FROM USED_GOODS_USER
WHERE USER_ID IN (SELECT WRITER_ID 
                  FROM USED_GOODS_BOARD
                  GROUP BY WRITER_ID
                  HAVING COUNT(WRITER_ID) >= 3)
ORDER BY USER_ID DESC;