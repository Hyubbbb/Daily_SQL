-- https://solvesql.com/problems/top-revenue-actors/
-- payment(rental_id, amount) / rental(rental_id, inventory_id)
-- inventory(inventory_id, film_id) / film_actor(film_id, actor_id)
-- actor(actor_id, first_name, last_name)

SELECT
    act.first_name,
    act.last_name,
    SUM(pay.amount) AS total_revenue
FROM actor AS act
    JOIN film_actor AS fl_act
        ON act.actor_id = fl_act.actor_id
    JOIN inventory AS inv
        ON fl_act.film_id = inv.film_id
    JOIN rental AS rt
        ON inv.inventory_id = rt.inventory_id
    JOIN payment AS pay
        ON rt.rental_id = pay.rental_id
GROUP BY act.actor_id, act.first_name, act.last_name
ORDER BY total_revenue DESC
LIMIT 5;
