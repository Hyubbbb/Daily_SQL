-- mapping between code and age in one-one
-- minumum number of gold galleons for high power and age

SELECT id, min_coins.age, min_coins.coins_needed, min_coins.power
FROM (
    
    SELECT MIN(coins_needed) AS coins_needed, power, age
    FROM (
        
        SELECT id, W.code, coins_needed, power, age
        FROM Wands W
            JOIN (SELECT * FROM Wands_Property WHERE is_evil = 0) WP
            ON W.code = WP.code
    ) non_evil
    
    GROUP BY age, power
    
) min_coins
    JOIN (
        
        SELECT id, W.code, coins_needed, power, age
        FROM Wands W
            JOIN (SELECT * FROM Wands_Property WHERE is_evil = 0) WP
            ON W.code = WP.code
    ) non_evil

    ON min_coins.age = non_evil.age 
        and min_coins.coins_needed = non_evil.coins_needed 
        and min_coins.power = non_evil.power
ORDER BY power DESC, age DESC;

