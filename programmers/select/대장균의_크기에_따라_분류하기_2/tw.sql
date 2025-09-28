WITH rank_tbl AS (
  SELECT
    id,
    PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) AS "size_rank"
  FROM ecoli_data
)

SELECT 
    id,
    CASE 
      WHEN size_rank <= 0.25 THEN "CRITICAL"
      WHEN size_rank <= 0.50 THEN "HIGH"
      WHEN size_rank <= 0.75 THEN "MEDIUM"
      ELSE "LOW"
    END "COLONY_NAME"
FROM rank_tbl
ORDER BY 1
