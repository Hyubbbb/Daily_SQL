-- https://school.programmers.co.kr/learn/courses/30/lessons/144856
SELECT B.AUTHOR_ID, A.AUTHOR_NAME, CATEGORY, 
SUM(PRICE*SALES) AS TOTAL_SALES 
FROM BOOK B
LEFT JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
LEFT JOIN BOOK_SALES S ON B.BOOK_ID = S.BOOK_ID
WHERE SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY AUTHOR_ID, CATEGORY
ORDER BY AUTHOR_ID ASC, CATEGORY DESC;