SELECT x,y,z, CASE WHEN X+Y <= Z THEN 'No' 
                   WHEN X+Z <= Y THEN 'No'
                   WHEN Y+Z <= X THEN 'No'
                   ELSE 'Yes' END AS triangle
FROM TRIANGLE
