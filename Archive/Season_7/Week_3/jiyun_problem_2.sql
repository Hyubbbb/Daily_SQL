SELECT name
FROM SalesPerson
WHERE name not in (
    SELECT S.name
    FROM SalesPerson S
        LEFT JOIN Orders O ON S.sales_id = O.sales_id
        LEFT JOIN Company C ON O.com_id = C.com_id
    WHERE C.name = 'RED'
)
