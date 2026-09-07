-- https://datalemur.com/questions/sql-page-with-no-likes
SELECT p.page_id
FROM pages AS p
    LEFT JOIN page_likes AS l
        ON p.page_id = l.page_id
WHERE 1=1
    AND l.page_id IS NULL;
