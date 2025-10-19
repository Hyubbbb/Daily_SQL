SELECT e3.ID
FROM ECOLI_DATA AS e3
JOIN ECOLI_DATA AS e2 ON e3.PARENT_ID = e2.ID
JOIN ECOLI_DATA AS e1 ON e2.PARENT_ID = e1.ID 
WHERE 1=1
    AND e1.PARENT_ID IS NULL 
    -- Convention: allias는 개체 이름 첫글자 / where 1=1
    -- e1: 1세대 e2: 2세대 e3: 3세대 
ORDER BY e3.ID;
