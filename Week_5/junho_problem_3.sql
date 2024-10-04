SELECT CASE WHEN A+B<=C or B+C<=A or C+A<=B THEN 'Not A Triangle'
            WHEN A=B AND B=C THEN 'Equilateral'
            WHEN A=B or B=C or C=A THEN 'Isosceles'
            ELSE 'Scalene'
            END AS t
FROM triangles;
