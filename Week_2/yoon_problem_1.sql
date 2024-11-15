SELECT date_format(datetime, '%k') as HOUR, count(*) as COUNT
FROM animal_outs
GROUP BY HOUR
HAVING HOUR between 9 and 19
ORDER BY date_format(datetime, '%H') ASC
