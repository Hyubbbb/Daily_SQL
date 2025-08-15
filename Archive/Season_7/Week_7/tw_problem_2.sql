# Write your MySQL query statement below

WITH cnt AS (SELECT query_name
    , result
    , position
    , rating
    , ROUND(SUM(rating/position)/COUNT(query_name), 2) AS 'quality'
    , COUNT(query_name)  AS 'whole_cnt'
    , SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS 'poor_cnt' -- poor rate를 여기에 조회
FROM Queries
GROUP BY query_name)

SELECT query_name
    , quality
    , ROUND((poor_cnt/whole_cnt)*100, 2) as "poor_query_percentage"
FROM cnt

-- 아 CASE WHEN으로 개수 세는거 또 가물가물
-- 은근 오래걸림 분발하자
