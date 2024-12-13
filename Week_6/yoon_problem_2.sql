SELECT
CL.name AS clothes,
C.name AS color,
CUS.last_name,
CUS.first_name
FROM ORDER AS O
JOIN CLOTHING AS CL
ON CL.id= O.clothing_id
JOIN COLOR AS C
ON C.id= CL.color_id
JOIN CUSTOMER AS CUS
ON CUS.id= O.customer_id
WHERE CUS.favorite_color_id= CL.color_id
ORDER BY C.name;
