WITH jan_sales AS (  -- 1월 판매 데이터
    SELECT
        book_id,
        SUM(sales) AS total_sales
    FROM book_sales
    WHERE 1=1
        AND sales_date >= '2022-01-01'
        AND sales_date < '2022-02-01'
    GROUP BY book_id
),

book_amount AS (  -- 작가 정보, 매출액 조인
    SELECT
        b.author_id,
        a.author_name,
        b.category,
        b.price * js.total_sales AS total_sales
    FROM jan_sales AS js
        JOIN book AS b
            ON js.book_id = b.book_id
        JOIN author AS a
            ON b.author_id = a.author_id
)

SELECT
    author_id,
    author_name,
    category,
    SUM(total_sales) AS sales
FROM book_amount
GROUP BY author_id, author_name, category
ORDER BY author_id, category DESC;
