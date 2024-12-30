SELECT x,y,z,CASE WHEN (x+y<=z OR y+z<=x OR z+x<=y) = TRUE THEN 'No'
                ELSE 'Yes' END as triangle
FROM triangle;
