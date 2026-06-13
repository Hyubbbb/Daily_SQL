SELECT fh.flavor
FROM first_half AS fh
    JOIN icecream_info AS ice
        ON fh.flavor = ice.flavor
WHERE 1=1
    AND fh.total_order > 3000
    AND ice.ingredient_type = 'fruit_based'
ORDER BY fh.total_order DESC