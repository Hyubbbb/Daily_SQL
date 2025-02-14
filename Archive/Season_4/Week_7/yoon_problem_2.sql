SELECT OrderID, SUM(Quantity),
CASE WHEN SUM(Quantity) <= 100 THEN 'A'
WHEN SUM(Quantity) <=200 THEN 'B'
ELSE 'C'
END 'Quantity_Category'
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity)>=50
