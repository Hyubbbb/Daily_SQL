SELECT CONCAT(NAME,'(',LEFT(OCCUPATION,1),')')
FROM occupations
ORDER BY name;

SELECT CONCAT('There are a total of ',COUNT(*), ' ', LOWER(occupation),'s.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;
