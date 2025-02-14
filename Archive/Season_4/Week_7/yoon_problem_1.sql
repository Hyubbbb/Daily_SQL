SELECT OrderDetails.ProductID, COUNT(OrderDetails.Quantity) AS QuantityCount, Products.ProductName
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.ProductID, Products.ProductName
ORDER BY QuantityCount DESC
LIMIT 10
