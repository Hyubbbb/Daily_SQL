--ListAllClothingItems
SELECT CL.name as clothes , CO.name as color , CU.first_name, CU.last_name
FROM ORDER O
JOIN CLOTHING CL
ON O.clothing_id = CL.id
JOIN CUSTOMER CU
ON O.customer_id = CU.id 
JOIN COLOR CO
ON CL.color_id = CO.id
WHERE CU.favorite_color_id = CL.color_id
ORDER BY CO.name;

--GetAllNon-BuyingCustomers
SELECT CU.last_name, CU.first_name, CO.name
FROM ORDER O
JOIN CUSTOMER CU
ON O.customer_id = CU.id
JOIN COLOR CO
ON CO.id = CU.favorite_color_id
WHERE CU.id NOT IN O.customer_id

SELECT CU.last_name, CU.first_name, CO.name
FROM CUSTOMER CU
JOIN COLOR CO
ON CO.id = CU.favorite_color_id
LEFT JOIN ORDER O
ON CU.id = O.customer_id
WHERE O.customer_id IS NULL;

--AllMainCategoriesandtheirSubcategories
SELECT M.name, C.name
FROM CATEGORY C
JOIN CATEGORY M
ON C.parent_id = M.id
WHERE M.parent_id IS NULL;