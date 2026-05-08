--https://school.programmers.co.kr/learn/courses/30/lessons/131115

SELECT *
FROM food_product AS food
WHERE 1=1
    AND food.price = (
        SELECT MAX(price)
        FROM food_product)