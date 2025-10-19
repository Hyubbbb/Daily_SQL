# Programmers > SELECT > 조건에 맞는 도서 리스트 출력하기
# SELECT Lv.1 연습 
SELECT
    b.book_id,
    DATE_FORMAT(b.published_date, '%Y-%m-%d') AS published_date
    # DATE_FORMAT()을 통해 날짜 형식 맞추기 중요 
FROM 
    book AS b 
WHERE 1=1
    AND b.category = '인문'
    # AND b.published_date >= '2021-01-01'
    # AND b.published_date <  '2022-01-01'
    AND YEAR(b.published_date) = 2021
ORDER BY 
    b.published_date; 
