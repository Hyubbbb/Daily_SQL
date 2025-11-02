# https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2
SELECT product_id
FROM products
WHERE 1=1 
    AND low_fats = 'Y' 
    AND recyclable = 'Y';
