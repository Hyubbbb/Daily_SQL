WITH best AS (
    SELECT 
	   food_type,
           MAX(favorites) AS max_fav
    FROM rest_info
    GROUP BY food_type
)

SELECT 
       rest.food_type,
       rest.rest_id,
       rest.rest_name,
       rest.favorites
FROM rest_info AS rest
	JOIN best AS b
    		ON rest.food_type = b.food_type
  		AND rest.favorites = b.max_fav
GROUP BY rest.food_type
ORDER BY rest.food_type DESC;