SELECT product_name, year, price
FROM Sales AS S
INNER JOIN Product AS P
ON S.product_id = P.product_id;
