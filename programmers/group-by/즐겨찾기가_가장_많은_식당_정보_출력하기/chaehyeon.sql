WITH best AS (
    SELECT 
	   food_type,
       MAX(favorites) AS max_fav
    FROM rest_info
    GROUP BY food_type
)

	
SELECT 
       info.food_type,  
       info.rest_id,
       info.rest_name,
       info.favorites
FROM rest_info AS info
	JOIN best AS b
    	ON info.food_type = b.food_type
  			AND info.favorites = b.max_fav
GROUP BY info.food_type
ORDER BY info.food_type DESC;
