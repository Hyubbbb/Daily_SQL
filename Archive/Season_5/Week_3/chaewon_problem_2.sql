-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/144854
-- BOOK 테이블과 AUTHOR 테이블을 조인하여 필요한 정보를 추출, 날짜 형식 추출 유의의
SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE 
FROM BOOK B JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID  
WHERE B.CATEGORY = '경제' 
ORDER BY B.PUBLISHED_DATE ASC;  