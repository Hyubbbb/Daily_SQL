-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
SELECT 
    -- A, B, C,
    CASE 
    WHEN A+B<=C OR A+C<=B OR B+C<=A THEN 'Not A Triangle'
    WHEN A=B AND B=C THEN 'Equilateral'
    WHEN A=B OR A=C OR B=C THEN 'Isosceles'
    
    WHEN A!=B AND B!=C AND A!=C THEN 'Scalene'
    -- ELSE 'YA'
    END
FROM TRIANGLES
