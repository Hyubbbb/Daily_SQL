SELECT product_name, SUM(unit) AS unit
FROM (SELECT *
        FROM Orders
        WHERE order_date LIKE '2020-02%') o
JOIN Products AS p
ON o.product_id = p.product_id
GROUP BY o.product_id
HAVING SUM(unit)>=100;
