WITH d AS (
    SELECT Name, ROW_NUMBER() OVER(ORDER BY Name) AS r
    FROM Occupations
    WHERE Occupation = 'Doctor'
),

p AS (
    SELECT Name, ROW_NUMBER() OVER(ORDER BY Name) AS r
    FROM Occupations
    WHERE Occupation = 'Professor'
),

s AS (
    SELECT Name, ROW_NUMBER() OVER(ORDER BY Name) AS r
    FROM Occupations
    WHERE Occupation = 'Singer'
),

a AS (
    SELECT Name, ROW_NUMBER() OVER(ORDER BY Name) AS r
    FROM Occupations
    WHERE Occupation = 'Actor'
)

SELECT d.Name AS Doctor, p.Name AS Professor, s.Name AS Singer, a.Name AS Actor
FROM p
LEFT OUTER JOIN d ON p.r = d.r
LEFT OUTER JOIN s ON p.r = s.r 
LEFT OUTER JOIN a ON p.r = a.r; 
