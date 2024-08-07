-- (https://school.programmers.co.kr/learn/courses/30/lessons/144856, Lv.4)

SELECT a.AUTHOR_ID, a.AUTHOR_NAME, CATEGORY, SUM(PRICE*SALES) AS TOTAL_SALES
FROM BOOK_SALES AS bs
JOIN BOOK AS b
ON bs.BOOK_ID = b.BOOK_ID
JOIN AUTHOR AS a
ON b.AUTHOR_ID = a.AUTHOR_ID
WHERE YEAR(SALES_DATE) = 2022 AND MONTH(SALES_DATE) = 1
GROUP BY a.AUTHOR_ID, CATEGORY
ORDER BY a.AUTHOR_ID, CATEGORY DESC;
