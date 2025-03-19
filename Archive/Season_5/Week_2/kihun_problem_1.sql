-- https://school.programmers.co.kr/learn/courses/30/lessons/133025

SELECT F_H.FLAVOR
FROM FIRST_HALF AS F_H
    INNER JOIN ICECREAM_INFO AS I_I
        ON F_H.FLAVOR = I_I.FLAVOR
WHERE TOTAL_ORDER > 3000 AND INGREDIENT_TYPE = 'fruit_based'
ORDER BY total_order desc;
