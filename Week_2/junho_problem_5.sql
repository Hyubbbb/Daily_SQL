-- (https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true)

SELECT CONCAT(name,'(',LEFT(occupation,1),')')
FROM occupations
ORDER BY name;

SELECT CONCAT('There are a total of ',COUNT(name),' ',LOWER(LEFT(occupation,1)),SUBSTR(occupation,2),'s.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;
