SELECT 
       food_type, 
       rest_id, 
       rest_name, 
       favorites
FROM rest_info 
WHERE 1=1
    AND (food_type, favorites) IN (
            SELECT food_type, MAX(favorites)
            FROM rest_info
            GROUP BY food_type)
ORDER BY food_type DESC
