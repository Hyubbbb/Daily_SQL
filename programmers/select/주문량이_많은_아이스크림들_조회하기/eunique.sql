SELECT
   f.flavor
FROM first_half AS f
    JOIN (
        SELECT 
            flavor, SUM(total_order) AS july_total
        FROM july
        GROUP BY flavor
    ) AS j
      ON f.flavor = j.flavor
ORDER BY (f.total_order + j.july_total) DESC
LIMIT 3; 
