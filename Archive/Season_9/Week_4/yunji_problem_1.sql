# 프로그래머스 > JOIN > 조건에 맞는 도서와 저자 리스트 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/144854
# 이번 메인 문제가 join이라 .. 

SELECT
    b.book_id,
    a.author_name,
    DATE_FORMAT(b.published_date, '%Y-%m-%d') AS published_date
FROM book b
JOIN author a
    ON b.author_id = a.author_id
WHERE category = '경제'
ORDER BY published_date
