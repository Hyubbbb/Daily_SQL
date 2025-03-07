SELECT DISTINCT(CITY)
FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('A', 'a', 'E', 'e', 'I', 'i', 'o', 'O', 'U', 'u')
