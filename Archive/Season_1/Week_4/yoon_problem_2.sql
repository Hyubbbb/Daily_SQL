SELECT NAME, COUNT(NAME) 
FROM ANIMAL_INS 
GROUP BY NAME HAVING COUNT(NAME) >= 2 
ORDER BY NAME