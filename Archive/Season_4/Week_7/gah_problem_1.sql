-- [HackerRank] Advanced Select > Type of Triangle

SELECT CASE 
        WHEN NOT (A + B > C AND A + C > B AND B + C > A) THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
       END
FROM TRIANGLES;
