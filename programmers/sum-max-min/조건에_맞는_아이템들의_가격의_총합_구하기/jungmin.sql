SELECT SUM(price) AS total_price
FROM item_info
WHERE 1=1
    AND rarity = 'LEGEND'
