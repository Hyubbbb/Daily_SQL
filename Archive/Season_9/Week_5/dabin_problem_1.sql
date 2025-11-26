-- 조건에 맞는 도서 리스트 출력하기 (윤다빈)
SELECT
    p.book_id,
    DATE_FORMAT(p.published_date, '%Y-%m-%d') AS published_date
FROM book AS p
WHERE p.published_date LIKE '2021%'
  AND p.category = '인문'
ORDER BY p.published_date ASC;
