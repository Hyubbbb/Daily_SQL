SELECT e3.id
FROM ecoli_data AS e3
    JOIN ecoli_data AS e2 ON e3.parent_id = e2.id
    JOIN ecoli_data AS e1 ON e2.parent_id = e1.id 
WHERE 1=1
    AND e1.parent_id IS NULL 
    -- Convention: allias는 개체 이름 첫글자 / where 1=1
    -- e1: 1세대 e2: 2세대 e3: 3세대 
ORDER BY e3.id;
