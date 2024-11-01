WITH milk_cart AS (SELECT CART_ID
                  FROM CART_PRODUCTS
                  WHERE NAME = 'Milk'),
yogurt_cart AS (SELECT CART_ID
               FROM CART_PRODUCTS
               WHERE NAME = 'Yogurt')

SELECT *
FROM milk_cart

INTERSECT

SELECT *
FROM yogurt_cart
