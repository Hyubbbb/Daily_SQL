SELECT 
    CASE WHEN GREATEST(A, B, C)*2 >= A + B + C THEN "Not A Triangle"
         WHEN A = B AND B = C THEN "Equilateral"  
         WHEN A = B OR A = C OR B = C THEN "Isosceles"
         WHEN A != B AND A != C  AND B != C THEN "Scalene"        
    END AS TRIANGLE
FROM TRIANGLES
