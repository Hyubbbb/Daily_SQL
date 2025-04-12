SELECT bike_id
FROM rental_history
WHERE rent_at LIKE '2021-01%'
GROUP BY bike_id HAVING SUM(distance) >= 50000
