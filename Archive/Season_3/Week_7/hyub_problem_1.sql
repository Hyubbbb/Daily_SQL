-- https://solvesql.com/problems/ratio-of-gifts/

SELECT 
  ROUND(100.0 * (SELECT COUNT(*) FROM artworks WHERE credit LIKE '%gift%') / (SELECT COUNT(*) FROM artworks), 3)
  AS ratio
