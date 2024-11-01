-- https://school.programmers.co.kr/learn/courses/30/lessons/273709
-- Indexing may optimize query performance. Materialized views may also be useful for frequent queries. Partitioning may also be useful for large tables.

SELECT SUM(PRICE) AS TOTAL_PRICE
FROM ITEM_INFO
WHERE RARITY = 'LEGEND';