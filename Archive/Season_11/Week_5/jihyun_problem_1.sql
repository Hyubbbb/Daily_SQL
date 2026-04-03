# --https://school.programmers.co.kr/learn/courses/30/lessons/144854
'경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력하는 SQL문을 작성해주세요.
결과는 출판일을 기준으로 오름차순 정렬해주세요.

SELECT b.book_id, a.author_name, TO_CHAR(b.published_date, 'YYYY-MM-DD') AS published_date
FROM book AS b
    JOIN author AS a
        ON b.author_id = a.author_id
WHERE 1=1
    AND b.category = '경제'
ORDER BY b.published_date